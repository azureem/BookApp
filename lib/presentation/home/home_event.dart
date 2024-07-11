import 'package:flutter/material.dart';
import 'home_bloc.dart';



@immutable
sealed class HomeEvent {}
class LoadDataEvent extends HomeEvent{
  final String categoryName;
  LoadDataEvent({required this.categoryName});

}
class AllBooksLoadEvent extends HomeEvent{

}