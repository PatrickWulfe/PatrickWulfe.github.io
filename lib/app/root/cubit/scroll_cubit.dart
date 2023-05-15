import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';

class ScrollCubit extends Cubit<ScrollDirection> {
  ScrollCubit() : super(ScrollDirection.forward);

  void scrollForward() {
    emit(ScrollDirection.forward);
  }

  void scrollBack() {
    emit(ScrollDirection.reverse);
  }
}
