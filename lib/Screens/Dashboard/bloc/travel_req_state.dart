part of 'travel_req_bloc.dart';

@immutable
abstract class TravelReqState {
  const TravelReqState();
}

class TravelReqInitial extends TravelReqState {
  const TravelReqInitial();
  @override
  List<Object> get props => [];
}

class TravelReqEmpty extends TravelReqState {
  const TravelReqEmpty();
  @override
  List<Object> get props => [];
}

class TravelReqLoading extends TravelReqState {
  const TravelReqLoading();
  @override
  List<Object> get props => [];
}

class TravelReqLoaded extends TravelReqState {
  final ApprovalModal travelRequest;

  const TravelReqLoaded({@required this.travelRequest}) ;

  @override
  List<Object> get props => [ApprovalModal];
}

class TravelReqError extends TravelReqState {
  final String message;
  const TravelReqError(this.message);
  @override
  List<Object> get props => [message];
}