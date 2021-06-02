import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app.dart';
import '../../../block_scaffold.dart';

class CubeBody extends StatefulWidget {
  const CubeBody({Key? key}) : super(key: key);

  @override
  _CubeBodyState createState() => _CubeBodyState();
}

/// Basic idea is to have it zoom out and rotate to whichever page like a cube
class _CubeBodyState extends State<CubeBody> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BlockScaffoldCubit>(context);
    var appBloc = BlocProvider.of<AppBloc>(context);
    var _zoomAnimationController = cubit.zoomAnimationController!;
    var _rollAnimationController = cubit.rollAnimationController!;
    var _toggleAnimationController = cubit.toggleAnimationController!;
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state is AppPageTransitioning) {
          // _padding = state.zoomedOut ? 20.0 : 0.0;
          cubit.setPageStack([state.currentPage, state.newPage]);
          _zoomAnimationController.repeat(reverse: true);
          _rollAnimationController.forward();
          _toggleAnimationController.reverse();
          _updateBloc(appBloc, state.newPage);
        } else if (state is AppPageDisplayed) {
          cubit.setPageStack([state.currentPage]);
          _toggleAnimationController.reverse();
          _zoomAnimationController.repeat(reverse: true);
        }
      },
      child: AnimatedBuilder(
        animation: _rollAnimationController,
        builder: (context, _) {
          return Transform.rotate(
            angle: math.pi * _rollAnimationController.value,
            child: Transform.scale(
              scale: 1 - (.5 * _zoomAnimationController.value),
              child: FlipDrawer(
                // child: Stack(children: cubit.state.pageStack),
                child: _getChildStack(),
              ),
            ),
          );
        },
      ),
    );
  }

  void _updateBloc(AppBloc bloc, Widget page) async {
    await Future.delayed(const Duration(seconds: 1));
    bloc.add(AppPageTransitionComplete(bloc.state.currentPage));
  }

  Widget _getChildStack() {
    var cubit = BlocProvider.of<BlockScaffoldCubit>(context);
    if (cubit.state.pageStack.length > 1) {
      return Stack(
        children: [
          cubit.state.pageStack[0],
          Transform.rotate(
            angle: math.pi,
            child: cubit.state.pageStack[1],
          )
        ],
      );
    }
    return Stack(children: cubit.state.pageStack);
  }
}
