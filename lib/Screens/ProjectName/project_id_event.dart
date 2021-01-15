part of 'project_id_bloc.dart';

@immutable
abstract class ProjectIdEvent {

  const ProjectIdEvent();
}
class FetchProject extends ProjectIdEvent{
final String pid;
const FetchProject(@required this.pid);

@override
List<Object> get props => [];
}