part of 'page_cube_bloc.dart';

abstract class PageCubeEvent extends Equatable {
  const PageCubeEvent();

  @override
  List<Object> get props => [];
}

class PageSelected extends PageCubeEvent {
  const PageSelected({required this.selectedIndex});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}

class AnimationComplete extends PageCubeEvent {
  const AnimationComplete({required this.currentIndex});

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}
