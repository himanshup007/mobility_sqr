part of 'aprrovals_bloc.dart';

@immutable
abstract class AprrovalsEvent {

  const AprrovalsEvent();
}

class Fetch_travel_req_approver extends AprrovalsEvent {
  const Fetch_travel_req_approver();

  @override
  List<Object> get props => [];
}