import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/ModelClasses/ProjectIdModel.dart';

part 'project_id_event.dart';
part 'project_id_state.dart';

class ProjectIdBloc extends Bloc<ProjectIdEvent, ProjectIdState> {
  final Repository repository;
  ProjectIdBloc(this.repository) : super(ProjectIdInitial());

  @override
  ProjectIdState get initialState => ProjectIdInitial();
  @override
  Stream<ProjectIdState> mapEventToState(
    ProjectIdEvent event,
  ) async* {
    yield ProjectIdLoading();
    if (event is FetchProject) {
      try {
        final ProjectIdModel result =
        await repository.GetProjectId(event.pid);

        yield ProjectIdLoaded(projectIdModel: result);
      } catch (_) {
        yield ProjectIdError("Couldn't Fetch Data");
      }
    }
  }
}
