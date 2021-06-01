import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_cube_event.dart';
part 'page_cube_state.dart';

class PageCubeBloc extends Bloc<PageCubeEvent, PageCubeState> {
  PageCubeBloc() : super(const PageDisplayed(currentIndex: 0));

  @override
  Stream<PageCubeState> mapEventToState(
    PageCubeEvent event,
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
