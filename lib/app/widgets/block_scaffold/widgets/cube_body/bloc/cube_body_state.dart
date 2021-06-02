part of 'cube_body_bloc.dart';

abstract class CubeBodyState extends Equatable {
  const CubeBodyState({required this.currentIndex});

  final int currentIndex;
  @override
  List<Object> get props => [];
}

class PageDisplayed extends CubeBodyState {
  const PageDisplayed({required int currentIndex})
      : super(currentIndex: currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class AnimatingTransition extends CubeBodyState {
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
