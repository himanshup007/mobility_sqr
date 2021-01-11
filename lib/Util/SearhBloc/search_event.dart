part of 'search_bloc.dart';

abstract class SearchEvent  {

  const SearchEvent();
}
class FetchSearchResult extends SearchEvent {
  final String query;

  const FetchSearchResult(@required this.query) ;

  @override
  List<Object> get props => [];
}