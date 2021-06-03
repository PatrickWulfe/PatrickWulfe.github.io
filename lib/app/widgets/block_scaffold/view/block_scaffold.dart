import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio_webapp/app/widgets/block_scaffold/block_scaffold.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum TransitionAniProps {
  scale,
  rotation,
  roll,
}

enum DrawerAniProps {
  slide,
}

class BlockScaffold extends StatefulWidget {
  const BlockScaffold({Key? key}) : super(key: key);

  @override
  _BlockScaffoldState createState() => _BlockScaffoldState();
}

class _BlockScaffoldState extends State<BlockScaffold> with AnimationMixin {
  late AnimationController cubeController;
  late Animation<TimelineValue<TransitionAniProps>> cubeAnimation;
  late AnimationController drawerController;
  late Animation<TimelineValue<DrawerAniProps>> drawerAnimation;

  static const scaleRatio = .5;

  @override
  void initState() {
    super.initState();
    cubeController = AnimationController(vsync: this, duration: rollDuration);
    cubeAnimation = TimelineTween<TransitionAniProps>()
        // Add scenes for zoom in/out
        .addScene(
          begin: 0.milliseconds,
          end: zoomDuration,
          curve: Curves.ease,
        )
        .animate(TransitionAniProps.scale,
            tween: Tween(
              begin: 0,
              end: .5,
            ))
        .addSubsequentScene(duration: zoomDuration)
        .animate(TransitionAniProps.scale,
            tween: Tween(
              begin: scaleRatio,
              end: 0,
            ))
        .parent
        // Add scene for rotation / roll
        .addScene(
          begin: 0.milliseconds,
          end: rollDuration,
          curve: Curves.ease,
        )
        .animate(TransitionAniProps.roll, tween: Tween(begin: 0, end: 1))
        .animate(TransitionAniProps.rotation,
            tween: Tween(begin: 0, end: math.pi))
        .parent
        .animatedBy(cubeController);

    // controller for drawer animations
    drawerController =
        AnimationController(vsync: this, duration: toggleDuration);
    drawerAnimation = TimelineTween<DrawerAniProps>()
        .addScene(
          begin: 0.milliseconds,
          end: toggleDuration,
          curve: Curves.ease,
        )
        .animate(DrawerAniProps.slide, tween: Tween(begin: 0, end: 1))
        .parent
        .animatedBy(drawerController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarPulltab(
          animation: drawerAnimation,
          controller: drawerController,
        ),
      ),
      body: Stack(
        children: [
          CubeBody(
            cubeController: cubeController,
            cubeAnimation: cubeAnimation,
            drawerController: drawerController,
            drawerAnimation: drawerAnimation,
          ),
        ],
      ),
    );
  }
}
