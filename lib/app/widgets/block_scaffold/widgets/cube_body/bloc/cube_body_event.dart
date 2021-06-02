part of 'cube_body_bloc.dart';

abstract class CubeBodyEvent extends Equatable {
  const CubeBodyEvent();

  @override
  List<Object> get props => [];
}

class CubePageSelected extends CubeBodyEvent {
  const CubePageSelected({required this.selectedIndex});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}

class CubeAnimationComplete extends CubeBodyEvent {
  const CubeAnimationComplete({required this.currentIndex});

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}
