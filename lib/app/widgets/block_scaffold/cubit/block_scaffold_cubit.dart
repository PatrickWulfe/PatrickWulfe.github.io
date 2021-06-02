import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_webapp/home/home.dart';

part 'block_scaffold_state.dart';

class BlockScaffoldCubit extends Cubit<BlockScaffoldState> {
  BlockScaffoldCubit()
      : super(BlockScaffoldState(pageStack: const [HomePage()]));

  AnimationController? toggleAnimationController;
  AnimationController? zoomAnimationController;
  AnimationController? rollAnimationController;

  double get toggleControllerValue => toggleAnimationController!.value;
  double get zoomControllerValue => zoomAnimationController!.value;
  double get rollControllerValue => rollAnimationController!.value;

  void setToggleController(AnimationController controller) =>
      toggleAnimationController = controller;
  void setZoomController(AnimationController controller) =>
      zoomAnimationController = controller;
  void setRollController(AnimationController controller) =>
      rollAnimationController = controller;

  void setPageStack(List<Widget> stack) =>
      emit(BlockScaffoldState(pageStack: stack));
}
