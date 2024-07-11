
import 'package:bloc/bloc.dart';
import 'package:book_hive/data/book_data.dart';
import 'package:book_hive/data/category_data.dart';
import 'package:book_hive/data/repo.dart';
import 'package:book_hive/presentation/auth/sign_in/items.dart';
import 'package:book_hive/presentation/home/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) {

    });

    on<LoadDataEvent>((event, emit) async {
      try {
        List<BookUiData> list = await Repo().getBooksByCategory(event.categoryName);
        emit(
            state.copyWith( hasError: false, errorMessage: '', booksByCategory: list));
      } catch (e) {
        emit(state.copyWith(isLoading: false, hasError: true, errorMessage: "Failed to load books or i dunnoo"));
      }
    });

    // on<AllBooksLoadEvent>((event, emit) async {
    //   try {
    //     List<BookUiData> list = await Repo().getBooks();
    //     emit(state.copyWith(isLoading: false, hasError: false, errorMessage: '', booksByCategory: list,
    //       ),
    //     );
    //     debugPrint('Fetched Books: ${list.length}');
    //   } catch (e) {
    //     debugPrint('Error loading books: $e');
    //   }
    // });
  }
}
