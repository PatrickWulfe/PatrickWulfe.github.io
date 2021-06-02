import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cube_body_event.dart';
part 'cube_body_state.dart';

class CubeBodyBloc extends Bloc<CubeBodyEvent, CubeBodyState> {
  CubeBodyBloc() : super(const PageDisplayed(currentIndex: 0));

  @override
  Stream<CubeBodyState> mapEventToState(
    CubeBodyEvent event,
  ) async* {
    if (event is PageSelected) {
      if (state is PageDisplayed) {
        if (event.selectedIndex != state.currentIndex) {
          yield AnimatingTransition(
              currentIndex: state.currentIndex,
              goalIndex: event.selectedIndex,
              zoomedOut: false);
        }
      }
    } else if (event is AnimationComplete) {
      yield PageDisplayed(currentIndex: event.currentIndex);
    }
  }
}
