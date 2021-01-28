import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/ModelClasses/SearchModelClass.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

 final  Repository repository;
   SearchBloc(this.repository) : super(SearchInitial());

  @override
  SearchState get initialState => SearchInitial();


  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    yield SearchClassLoading();
    if (event is FetchSearchResult) {

      try {
        final SearchModel result = await repository.fetch_location(event.query);
        if(result!=null){
          if(result.data.length>0){
            yield SearchClassLoaded(location: result);
          }
        else{
            yield SearchClassError("No Search Result Found");

          }

        }
        else{
          yield SearchClassEmpty();
        }

      }
      catch (_) {
        yield  SearchClassError("Couldn't Fetch Data");
      }
    }
  }
}
