part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {}

class AppInit extends AppEvent {
  @override
  List<Object?> get props => [];
}

class AppPageSelected extends AppEvent {
  AppPageSelected({required this.prevPage, required this.newPage});
  final Widget prevPage;
  final Widget newPage;

  @override
  List<Object?> get props => [prevPage, newPage];
}

class AppPageTransitionComplete extends AppEvent {
  AppPageTransitionComplete(this.newPage);
  final Widget newPage;

  @override
  List<Object?> get props => [newPage];
}
