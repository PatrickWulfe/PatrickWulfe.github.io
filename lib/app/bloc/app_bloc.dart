import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio_project/app/app_index.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

@Injectable()
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          const _Normal(
            themeName: ThemeName.dark,
            pageIndex: 0,
            isScrollingDown: false,
          ),
        ) {
    on<AppEvent>((event, emit) {
      event.when(
        started: () {},
        themeChanged: (ThemeName themeName) =>
            emit(state.copyWith(themeName: themeName)),
        themeSwapped: () => state.themeName == ThemeName.light
            ? emit(state.copyWith(themeName: ThemeName.dark))
            : emit(state.copyWith(themeName: ThemeName.light)),
        pageScroll: (scrollDirection) =>
            (scrollDirection == ScrollDirection.forward)
                ? emit(state.copyWith(isScrollingDown: true))
                : emit(state.copyWith(isScrollingDown: false)),
        pageChanged: (pageIndex) => emit(state.copyWith(pageIndex: pageIndex)),
      );
    });
  }

  late final PageController pageController;
}
