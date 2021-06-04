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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppPageTransitioning) {
          widget.cubeController.reset();
          widget.drawerController.reverse();
          widget.cubeController.forward();
          return AnimatedBuilder(
            animation: widget.cubeController,
            builder: (context, _) {
              return Transform.rotate(
                angle: math.pi *
                    widget.cubeAnimation.value.get(TransitionAniProps.rotation),
                child: Transform.scale(
                  scale: 1 -
                      widget.cubeAnimation.value.get(TransitionAniProps.scale),
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: Offset(
                            maxSlide *
                                (1 -
                                    widget.cubeAnimation.value
                                        .get(TransitionAniProps.roll)),
                            0),
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, .001)
                            ..rotateY((-math.pi / 2) *
                                (1 -
                                    widget.cubeAnimation.value
                                        .get(TransitionAniProps.roll))),
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: state.newPage,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            maxSlide *
                                -1 *
                                widget.cubeAnimation.value
                                    .get(TransitionAniProps.roll),
                            0),
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, .001)
                            ..rotateY((math.pi / 2) *
                                widget.cubeAnimation.value
                                    .get(TransitionAniProps.rotation)),
                          alignment: Alignment.centerRight,
                          child: Transform.rotate(
                            angle: math.pi,
                            child: state.currentPage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return FlipDrawer(
            animationController: widget.drawerController,
            animation: widget.drawerAnimation,
            child: Stack(
              children: [
                state.currentPage,
              ],
            ),
          );
          // return childStack;
        }
      },
      buildWhen: (previous, current) => previous != current,
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
