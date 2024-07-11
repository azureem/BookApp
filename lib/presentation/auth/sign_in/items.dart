import 'package:book_hive/data/book_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemHome(
    String txtCategory,
    Color color,
    Color txtColor
    ){
  return Container(

    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8.0)
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 12, bottom: 12),
      child: Text(txtCategory, style: TextStyle(color: txtColor, fontSize: 18),),
    ),
  );
}


class CategoryDataa {
  String txtCategory;
  Color color;
  Color txtColor;

  CategoryDataa({required this.txtCategory, required this.color, required this.txtColor});
}
Color myColor = Color(0xFFFFFFFF);
List<CategoryDataa> lsCategory =[
  CategoryDataa(txtCategory: 'All', color: Color(0xFFcaf0f8), txtColor: Colors.blue),
    CategoryDataa(txtCategory: 'psycology', color: Color(0xFFfcd5ce),
        txtColor: Colors.red),
  CategoryDataa(txtCategory: 'literature', color: Color(0xFFdde5b6), txtColor: Colors.green),
   // CategoryDataa(txtCategory: 'Humour', color: Color(0xFFfcf6bd), txtColor: Colors.yellow),
];

Widget itemBook(BookUiData data) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
    ),
    height: 250,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child:   Image.network(data.img?? 'https://via.placeholder.com/150', fit: BoxFit.cover),
    ),
  );
}


List<String> listImg = [
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',
  'assets/images/kitob.png',

];



