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
    var _zoomAnimationController = cubit.zoomAnimationController!;
    var _rollAnimationController = cubit.rollAnimationController!;
    var _toggleAnimationController = cubit.toggleAnimationController!;
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state is AppPageTransitioning) {
          // _padding = state.zoomedOut ? 20.0 : 0.0;
          cubit.setPageStack([state.currentPage, state.newPage]);
          _zoomAnimationController.forward();
          _rollAnimationController.forward();
          _zoomAnimationController.reverse();
          _toggleAnimationController.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _rollAnimationController,
        builder: (context, _) {
          return Transform.rotate(
            angle: math.pi * _rollAnimationController.value,
            child: Transform.scale(
              scale: 1 - (.25 * _zoomAnimationController.value),
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
