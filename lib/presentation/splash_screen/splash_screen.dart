import 'package:book_hive/presentation/auth/sign_in/log_in_screen.dart';
import 'package:book_hive/presentation/auth/sign_up/register_screen.dart';
import 'package:flutter/material.dart';

import '../../data/my_pref.dart';
import '../bottom/bottom.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  // @override
  // void initState()  {
  //   super.initState();
  //   // MyPref.init();
  //
  //
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,
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
                  Center(
                    child: Image.asset('assets/images/headphone.png',
                        width: 130, height: 130),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 24,
                      right: 24,
                      child: Image.asset(
                        'assets/images/title.png',
                        height: 60,
                        fit: BoxFit.contain,
                      ))
                ],
              )),
          Expanded(flex: 1, child: SizedBox(height: 0)),
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/splash_book.png',
                      fit: BoxFit.cover,),
                  ),
                  Positioned(
                    bottom: 24,
                    right: 24,





                    child: GestureDetector(
                      onTap: (){
                        if(MyPref.getUserName() == null || MyPref.getUserName()==''){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()));
                        }

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(56),
                            color: Color(0xFFF26B6C)
                        ),

                        child: Padding(

                          padding: const EdgeInsets.only(left: 32.0, right: 32, top: 6, bottom: 6),
                          child: Row(
                            children: [ Text('Get Started', style: TextStyle(fontSize: 24, color: Colors.white),),
                              SizedBox(width: 8,),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 18,)],
                          ),
                        ),
                      ),
                    ),









                  )
                ],
              ))
        ],
      ),
    );
  }
}

