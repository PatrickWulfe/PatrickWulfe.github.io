import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:portfolio_webapp/home/home.dart';
import '../app.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppPageDisplayed(currentPage: HomePage()));

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppInit) {
      yield const AppPageDisplayed(currentPage: HomePage());
    } else if (event is AppPageSelected) {
      yield AppPageTransitioning(
        currentPage: event.prevPage,
        newPage: event.newPage,
      );
      await Future.delayed(rollDuration);
      yield AppPageDisplayed(currentPage: event.newPage);
    } else if (event is AppPageTransitionComplete) {
      yield AppPageDisplayed(currentPage: event.newPage);
    } else {
      yield const AppPageDisplayed(currentPage: HomePage());
    }
  }
}
