import 'package:flutter/foundation.dart';
import '../../data/book_data.dart';

@immutable
class HomeState {
  final bool isLoading;
  final bool hasError;
  final String errorMessage;
  final List<BookUiData> booksByCategory;

  const HomeState({
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = '',
    this.booksByCategory = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
    List<BookUiData>? booksByCategory,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      booksByCategory: booksByCategory ?? this.booksByCategory,
    );
  }
}
