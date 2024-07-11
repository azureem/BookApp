import 'package:flutter/foundation.dart';
import '../../data/book_data.dart';

@immutable
class SearchState {
  final bool isLoading;
  final bool hasError;
  final String errorMessage;
  final List<BookUiData> booksByCategory;
  final String query;

  const SearchState({
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = '',
    this.booksByCategory = const [],
    this.query=""
  });

  SearchState copyWith({
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
    List<BookUiData>? booksByCategory,
    String? query,
  })
  {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      booksByCategory: booksByCategory ?? this.booksByCategory,
      query: query ?? this.query,
    );
  }
}
