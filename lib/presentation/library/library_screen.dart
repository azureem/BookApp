import 'package:book_hive/presentation/auth/sign_in/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black54, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Library',
            style: TextStyle(
              color: Color(0xFFF26B6C),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black54, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Recently Played ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('see all',
                      style: TextStyle(
                        color: Color(0xFFF26B6C),
                        fontSize: 18,
                      ))
                ],
              ),
              SizedBox(height: 24.0,),
              // SizedBox(
              //   height: 164.0,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: lsCategory.length,
              //     itemBuilder: ( context, index){
              //       String data = listImg[index];
              //       return InkWell(
              //         onTap: (){},
              //         child: itemBook()
              //       );
              //     }, separatorBuilder: (BuildContext context, int index) {
              //       return SizedBox(width: 8.0,);
              //   },
              //   ),
              // ),
              SizedBox(height: 24.0,),
              Row(
                children: [
                  Text(
                    'Playlists',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('see all',
                      style: TextStyle(
                        color: Color(0xFFF26B6C),
                        fontSize: 18,
                      ))
                ],
              ),
              SizedBox(height: 24.0,),
              Row(
                children: [
                  Text(
                    'Bookmarks ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('see all',
                      style: TextStyle(
                        color: Color(0xFFF26B6C),
                        fontSize: 18,
                      ))
                ],
              ),
              SizedBox(height: 24.0,),
              SizedBox(height: 24.0,),
              Row(
                children: [
                  Text(
                    'Most Played ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('see all',
                      style: TextStyle(
                        color: Color(0xFFF26B6C),
                        fontSize: 18,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
