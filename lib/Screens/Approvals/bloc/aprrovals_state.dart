part of 'aprrovals_bloc.dart';

@immutable
abstract class AprrovalsState {
const AprrovalsState();

}
class AprrovalsInitial extends AprrovalsState {
  const AprrovalsInitial();
  @override
  List<Object> get props => [];
}

class  AprrovalsEmpty extends AprrovalsState {
  const AprrovalsEmpty();
  @override
  List<Object> get props => [];
}

class AprrovalsLoading extends AprrovalsState {
  const AprrovalsLoading();
  @override
  List<Object> get props => [];
}

class AprrovalsLoaded extends AprrovalsState {
  final ApprovalModal approvalModal;

  const AprrovalsLoaded({@required this.approvalModal}) ;

  @override
  List<Object> get props => [approvalModal];
}

class AprrovalsError extends AprrovalsState {
  final String message;
  const AprrovalsError(this.message);
  @override
  List<Object> get props => [message];
}