import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../../../app.dart';
import '../../../block_scaffold.dart';

class CubeBody extends StatefulWidget {
  const CubeBody({
    Key? key,
    required this.cubeController,
    required this.drawerController,
    required this.cubeAnimation,
    required this.drawerAnimation,
  }) : super(key: key);

  final AnimationController cubeController;
  final AnimationController drawerController;
  final Animation<TimelineValue<TransitionAniProps>> cubeAnimation;
  final Animation<TimelineValue<DrawerAniProps>> drawerAnimation;

  @override
  _CubeBodyState createState() => _CubeBodyState();
}

/// Basic idea is to have it zoom out and rotate to whichever page like a cube
class _CubeBodyState extends State<CubeBody> {
  Widget childStack = const SizedBox(
    height: 20,
    width: 20,
    child: Center(child: CircularProgressIndicator()),
  );
  @override
  Widget build(BuildContext context) {
    var appBloc = BlocProvider.of<AppBloc>(context);
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        _getChildStack();
        if (state is AppPageTransitioning) {
          widget.cubeController.reset();
          widget.cubeController.forward();
          _updateBloc(appBloc, state.newPage);
        } else if (state is AppPageDisplayed) {
          widget.cubeController.reset();
        }
      },
      child: AnimatedBuilder(
        animation: widget.cubeController,
        builder: (context, _) {
          return Transform.rotate(
            angle: widget.cubeAnimation.value.get(TransitionAniProps.rotation),
            child: Transform.scale(
              scale:
                  1 - widget.cubeAnimation.value.get(TransitionAniProps.scale),
              child: Stack(
                children: [
                  const WaveBackground(),
                  FlipDrawer(
                    animationController: widget.drawerController,
                    animation: widget.drawerAnimation,
                    child: childStack,
                  ),
                ],
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

  void _getChildStack() {
    var bloc = BlocProvider.of<AppBloc>(context);
    if (bloc.state is AppPageTransitioning) {
      childStack = Stack(
        children: [
          bloc.state.currentPage,
          Transform.rotate(
            angle: math.pi,
            child: (bloc.state as AppPageTransitioning).newPage,
          )
        ],
      );
    }
    childStack = Stack(
      children: [
        bloc.state.currentPage,
      ],
    );
  }
}

class WaveBackground extends StatelessWidget {
  const WaveBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: WaveWidget(
        config: CustomConfig(
          blur: const MaskFilter.blur(BlurStyle.inner, 10),
          heightPercentages: [.4, .42, .43],
          durations: [35000, 13370, 19440],
          gradients: [
            [Colors.cyan.withAlpha(200), Colors.cyanAccent],
            [Colors.black26, Colors.cyanAccent],
            [Colors.purple.withAlpha(150), Colors.purpleAccent],
          ],
        ),
        size: const Size(
          double.infinity,
          double.infinity,
        ),
      ),
    );
  }
}
