part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}
class AllBooksEventInSearch extends SearchEvent{}
class SearchInputChanged extends SearchEvent{
  String query;
  SearchInputChanged( this.query);
}
