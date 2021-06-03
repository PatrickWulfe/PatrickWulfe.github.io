import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../block_scaffold.dart';
import '../flip_drawer.dart';

class FlipDrawer extends StatefulWidget {
  const FlipDrawer({
    Key? key,
    required this.child,
    required this.animationController,
    required this.animation,
  }) : super(key: key);

  final Widget child;
  final AnimationController animationController;
  final Animation<TimelineValue<DrawerAniProps>> animation;

  @override
  _FlipDrawerState createState() => _FlipDrawerState();
}

class _FlipDrawerState extends State<FlipDrawer> {
  final bool _canBeDragged = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Stack(
          children: [
            Transform.translate(
              offset: Offset(
                -maxSlide +
                    (maxSlide *
                        (widget.animation.value.get(DrawerAniProps.slide))),
                0,
              ),
              child: Transform(
                transform: Matrix4.identity(),
                // ..setEntry(3, 2, .001)
                // ..rotateY(math.pi / 2 * (1 - widget.animationController.value)),
                alignment: Alignment.centerRight,
                child: NavDrawer(
                  animationController: widget.animationController,
                  width: maxSlide.toDouble(),
                  parent: widget,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(
                maxSlide * widget.animation.value.get(DrawerAniProps.slide),
                0,
              ),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, .001)
                  ..rotateY(-math.pi /
                      2 *
                      widget.animation.value.get(DrawerAniProps.slide)),
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.black,
                  child: child,
                ),
              ),
            ),
          ],
        );
      },
      child: widget.child,
    );
  }

  void toggle() => widget.animationController.isDismissed
      ? widget.animationController.forward()
      : widget.animationController.reverse();

  void close() {
    if (_canBeDragged && widget.animationController.isCompleted) toggle();
  }

  void open() {
    if (_canBeDragged && widget.animationController.isDismissed) toggle();
  }
}
