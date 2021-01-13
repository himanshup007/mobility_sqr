part of 'purpose_bloc.dart';

@immutable
abstract class PurposeState {
  const PurposeState();
}

class PurposeInitial extends PurposeState {
  const PurposeInitial();
  @override
  List<Object> get props =>[];

}

class PurposeLoading extends PurposeState {
  const PurposeLoading();
  @override
  List<Object> get props => [];
}
class PurposeLoaded extends PurposeState {
  final PurposeModelClass purposelist;

  const PurposeLoaded({@required this.purposelist}) ;

  @override
  List<Object> get props => [PurposeModelClass];
}

class  PurposeError extends PurposeState {
  final String message;
  const  PurposeError(this.message);
  @override
  List<Object> get props => [message];
}