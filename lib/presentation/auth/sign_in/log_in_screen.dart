import 'package:book_hive/data/my_pref.dart';
import 'package:book_hive/data/repo.dart';
import 'package:book_hive/presentation/auth/sign_in/log_in_screen.dart';
import 'package:book_hive/presentation/auth/sign_in/login_bloc.dart';
import 'package:book_hive/presentation/auth/sign_up/register_screen.dart';
import 'package:book_hive/presentation/bottom/bottom.dart';
import 'package:book_hive/presentation/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      // ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                        'assets/images/triangle.png',
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.black54,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Go back',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Image.asset(
                          'assets/images/headphone.png',
                          width: 120,
                          height: 120,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                        Text(
                          'Sign In to continue',
                          style: TextStyle(color: Colors.black54, fontSize: 24),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black54, fontSize: 24),
                      decoration: InputDecoration(
                          hintText: 'Email Address',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          )),
                      controller: nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black54, fontSize: 24),
                      decoration: InputDecoration(
                          hintText: 'Password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          )),
                      controller: passwordController,
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32.0),
                        child: Text(
                          'Forgot password?',
                          style:
                          TextStyle(color: Color(0xFFF26B6C), fontSize: 18),
                        ),
                      )),
                  SizedBox(
                    height: 24.0,
                  ),
                  BlocProvider(
                    create: (context) => LoginBloc(),
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {

                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () async {
                            context.read<LoginBloc>().add(
                                LoginSuccessEvent(nameController.text,
                                    passwordController.text));

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bottom()),
                            );
                            await MyPref().saveUserName(nameController.text);
                            // if (state is LoginSuccess ) {
                            //
                            //
                            // } else {
                            //   Fluttertoast.showToast(
                            //     msg: "Not found this user!",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.TOP,
                            //     backgroundColor: Colors.red,
                            //     textColor: Colors.white,
                            //   );
                            // }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(56),
                                color: Color(0xFFF26B6C)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 32.0, right: 32, top: 8, bottom: 8),
                              child: Text(
                                '      SIGN IN      ',
                                style:
                                TextStyle(fontSize: 22, color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'or sign in using',
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                    onTap: (){
                      Repo().registerWithGoogle();
                    }

                        ,
                        child: Image.asset(
                          'assets/images/google.png',
                          width: 48,
                          height: 48,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Image.asset(
                        'assets/images/facebook.png',
                        width: 56,
                        height: 56,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Align(
                //    alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Do not have an account? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
                        },
                        child: GestureDetector(
                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Color(0xFFF26B6C),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
