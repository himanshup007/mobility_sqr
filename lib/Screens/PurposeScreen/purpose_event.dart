part of 'purpose_bloc.dart';

@immutable
abstract class PurposeEvent {
  const PurposeEvent();
}
class FetchPurposelist extends PurposeEvent{
  final String iataCode;
  const FetchPurposelist(@required this.iataCode);

  @override
  List<Object> get props => [];
}