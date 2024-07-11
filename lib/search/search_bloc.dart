import 'package:bloc/bloc.dart';
import 'package:book_hive/search/search_state.dart';
import 'package:meta/meta.dart';

import '../data/book_data.dart';
import '../data/repo.dart';
part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchEvent>((event, emit) {

    });

    on<AllBooksEventInSearch>((event, emit) async {
      try {

        List<BookUiData> list = await Repo().getBooks();

        emit(state.copyWith(
          isLoading: false,
          booksByCategory: list,
          hasError: false,
          errorMessage: '',
        ));
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: e.toString(),
        ));
      }
    });

    on<SearchInputChanged>((event, emit) {
      final query = event.query.toLowerCase();
      final filteredBooks = state.booksByCategory
          .where((book) => book.title.toLowerCase().contains(query))
          .toList();
      emit(state.copyWith(
        booksByCategory: filteredBooks,
        query: event.query,
      ));
    });


  }}
