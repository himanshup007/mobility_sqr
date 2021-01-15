part of 'project_id_bloc.dart';

@immutable
abstract class ProjectIdState {

  const ProjectIdState();
}

class ProjectIdInitial extends ProjectIdState {
  const ProjectIdInitial();

  @override
  List<Object> get props =>[];



}
class ProjectIdLoading extends ProjectIdState {
  const ProjectIdLoading();
  @override
  List<Object> get props => [];
}
class ProjectIdLoaded extends ProjectIdState {
  final ProjectIdModel projectIdModel;

  const ProjectIdLoaded({@required this.projectIdModel}) ;

  @override
  List<Object> get props => [projectIdModel];
}

class  ProjectIdError extends ProjectIdState {
  final String message;
  const  ProjectIdError(this.message);
  @override
  List<Object> get props => [message];
}