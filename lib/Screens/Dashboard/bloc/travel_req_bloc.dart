import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';

part 'travel_req_event.dart';
part 'travel_req_state.dart';


class TravelReqBloc extends Bloc<TravelReqEvent, TravelReqState> {

  final Repository repository;

  TravelReqBloc(this.repository) : super(TravelReqInitial());

  @override
  TravelReqState get initialState => TravelReqInitial();

  @override
  Stream<TravelReqState> mapEventToState(TravelReqEvent event,) async* {
    yield TravelReqLoading();
    if (event is FetchTravelReq) {

      try {
        final GetTravelRequest quote = await repository.fetch_travel_req();
        yield TravelReqLoaded(travelRequest: quote);
      }
      catch (_) {
        yield TravelReqError("Couldn't Fetch Data");
      }
    }
  }
}