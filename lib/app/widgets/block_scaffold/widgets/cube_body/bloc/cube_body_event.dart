part of 'cube_body_bloc.dart';

abstract class CubeBodyEvent extends Equatable {
  const CubeBodyEvent();

  @override
  List<Object> get props => [];
}

class PageSelected extends CubeBodyEvent {
  const PageSelected({required this.selectedIndex});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}

class AnimationComplete extends CubeBodyEvent {
  const AnimationComplete({required this.currentIndex});

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}
