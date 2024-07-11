import 'package:book_hive/presentation/auth/sign_in/log_in_screen.dart';
import 'package:book_hive/presentation/auth/sign_up/register_bloc.dart';
import 'package:book_hive/presentation/bottom/bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/my_pref.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();

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
                          'Create an account',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                        Text(
                          'Register to continue',
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
                      controller: passwordController1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black54, fontSize: 24),
                      decoration: InputDecoration(
                          hintText: 'Retype password',
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
                      controller: passwordController2,
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  BlocProvider(
                    create: (context) => RegisterBloc(),
                    child: BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {

                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () async{
                            String name = nameController.text;
                            String password1 = passwordController1.text;
                            String password2 = passwordController2.text;

                            if (name.isEmpty || password1.isEmpty || password2.isEmpty) {
                              Fluttertoast.showToast(
                                msg: "Please fill in all fields",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                              return;
                            }

                            if (password1 != password2) {
                              Fluttertoast.showToast(
                                msg: "Mismatch your passwords!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                              return;
                            }

                            context.read<RegisterBloc>().add(RegisterUser(nameController.text, passwordController2.text));

                            await MyPref().saveUserName(nameController.text);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bottom()),
                            );
                            // if (state is RegisterSuccess) {
                            //
                            // } else {
                            //   Fluttertoast.showToast(
                            //     msg: "User can't be registered",
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
                                '      REGISTER      ',
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
                    'or register using',
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        width: 48,
                        height: 48,
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
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Already have an account? ',
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
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color(0xFFF26B6C),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
