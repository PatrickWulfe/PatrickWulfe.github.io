part of 'page_cube_bloc.dart';

abstract class PageCubeState extends Equatable {
  const PageCubeState({required this.currentIndex});

  final int currentIndex;
  @override
  List<Object> get props => [];
}

class PageDisplayed extends PageCubeState {
  const PageDisplayed({required int currentIndex})
      : super(currentIndex: currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class AnimatingTransition extends PageCubeState {
  const AnimatingTransition({
    required int currentIndex,
    required this.goalIndex,
    required this.zoomedOut,
  }) : super(currentIndex: currentIndex);
  final int goalIndex;
  final bool zoomedOut;

  @override
  List<Object> get props => [currentIndex, goalIndex];
}
