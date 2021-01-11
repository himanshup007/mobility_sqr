part of 'search_bloc.dart';

@immutable
abstract class SearchState  {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
  @override
  List<Object> get props => [];
}

class SearchClassEmpty extends SearchState{
 const SearchClassEmpty();
  @override

  List<Object> get props => [];

}
class SearchClassLoading extends SearchState {
  const SearchClassLoading();
  @override
  List<Object> get props => [];
}
class SearchClassLoaded extends SearchState {
  final SearchModel location;

  const SearchClassLoaded({@required this.location}) ;

  @override
  List<Object> get props => [SearchModel];
}

class  SearchClassError extends SearchState {
  final String message;
  const  SearchClassError(this.message);
  @override
  List<Object> get props => [message];
}