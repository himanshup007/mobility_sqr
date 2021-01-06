part of 'travel_req_bloc.dart';

@immutable
abstract class TravelReqEvent extends Equatable {
  const TravelReqEvent();
}

class FetchTravelReq extends TravelReqEvent {
  const FetchTravelReq();

  @override
  List<Object> get props => [];
}