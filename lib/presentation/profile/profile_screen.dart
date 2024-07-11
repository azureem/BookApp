import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF26B6C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
         GestureDetector(
           onTap: (){

           },
             child: Image.asset('assets/images/edit.png', width: 28, height: 28,)),
        ],
      ),
      body:Column(
        children: [
          Expanded(
            flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF26B6C),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                  )
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 116,
                      left: 118,
                      child: Align(
                        alignment: Alignment.center,
                          child: Image.asset('assets/images/odam.png', width: 160, height: 160,)),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 56.0),
                          child: Text('Maria Akter Dipti', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  children: [
                    SizedBox(height: 16.0,),
                    Row(
                      children: [
                        Text('User Name', style: TextStyle(color: Color(0xFFF26B6C), fontSize: 20),),
                      Spacer(),
                Text('dipti_2020', style: TextStyle(color: Colors.black54, fontSize: 20),),
                    ]),
                    SizedBox(height: 16.0,),
                    Row(
                      children: [
                        Text('Email', style: TextStyle(color: Color(0xFFF26B6C), fontSize: 20),),
                        Spacer(),
                        Text('mariadipti@gmail.com', style: TextStyle(color: Colors.black54, fontSize: 20),)],
                    ),
                    SizedBox(height: 16.0,),
                    Row(
                      children: [
                        Text('Change password', style: TextStyle(color: Color(0xFFF26B6C), fontSize: 20),),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black54,)],
                    ),
                    SizedBox(height: 16.0,),

                    Row(
                      children: [
                        Text('Notification', style: TextStyle(color: Color(0xFFF26B6C), fontSize: 20),),
                        Spacer(),
                        Icon(Icons.notifications_none, size: 24, color: Colors.black54,)],
                    ),
                    SizedBox(height: 16.0,),
                    Row(
                      children: [
                        Text('Enable Dark Mode', style: TextStyle(color: Color(0xFFF26B6C), fontSize: 20),),
                        Spacer(),
                        Image.asset('assets/images/moon.png', width: 20,  height: 20,)],
                    ),
                    SizedBox(height: 16.0,),
                    Row(
                      children: [
                        Text('Settings', style: TextStyle(color: Color(0xFFF26B6C), fontSize: 20),),
                        Spacer(),
                        Icon(Icons.settings, size: 24, color: Colors.black54,)],
                    ),
                    SizedBox(height: 16.0,),

                  ],
                ),
              ))
        ],

      ),
    );
  }
}
