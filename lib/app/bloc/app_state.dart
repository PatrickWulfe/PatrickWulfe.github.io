part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {
  const AppState({required this.currentPage});
  final Widget currentPage;
}

class AppPageDisplayed extends AppState {
  const AppPageDisplayed({required Widget currentPage})
      : super(currentPage: currentPage);

  @override
  List<Object?> get props => [currentPage];
}

class AppPageTransitioning extends AppState {
  const AppPageTransitioning({
    required Widget currentPage,
    required this.newPage,
  }) : super(currentPage: currentPage);
  final Widget newPage;

  @override
  List<Object?> get props => [currentPage, newPage];
}
