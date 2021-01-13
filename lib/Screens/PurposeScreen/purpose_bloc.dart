import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';

part 'purpose_event.dart';

part 'purpose_state.dart';

class PurposeBloc extends Bloc<PurposeEvent, PurposeState> {
  final Repository repository;

  PurposeBloc(this.repository) : super(PurposeInitial());

  @override
  PurposeState get initialState => PurposeInitial();

  @override
  Stream<PurposeState> mapEventToState(
    PurposeEvent event,
  ) async* {
    yield PurposeLoading();
    if (event is FetchPurposelist) {
      try {
        final PurposeModelClass result =
            await repository.getPurposeList(event.iataCode);

        yield PurposeLoaded(purposelist: result);
      } catch (_) {
        yield PurposeError("Couldn't Fetch Data");
      }
    }
  }
}
