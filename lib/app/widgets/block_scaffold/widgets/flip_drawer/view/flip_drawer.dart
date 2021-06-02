import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../block_scaffold.dart';
import '../flip_drawer.dart';

class FlipDrawer extends StatefulWidget {
  FlipDrawer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  late AnimationController? animationController;

  @override
  _FlipDrawerState createState() => _FlipDrawerState();
}

class _FlipDrawerState extends State<FlipDrawer> {
  bool _canBeDragged = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.animationController =
        BlocProvider.of<BlockScaffoldCubit>(context).toggleAnimationController!;
    return PhysicalModel(
      elevation: 10,
      color: Colors.black,
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragEnd: _onDragEnd,
        onHorizontalDragUpdate: _onDragUpdate,
        onTap: toggle,
        child: AnimatedBuilder(
          animation: CurvedAnimation(
            parent: widget.animationController!,
            curve: Curves.bounceInOut,
          ),
          builder: (context, child) {
            return Stack(
              children: [
                RotatedBox(
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
                ),
                Transform.translate(
                  offset: Offset(
                      maxSlide * (widget.animationController!.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, .001)
                      ..rotateY(math.pi /
                          2 *
                          (1 - widget.animationController!.value)),
                    alignment: Alignment.centerRight,
                    child: NavDrawer(
                      animationController: widget.animationController!,
                      width: maxSlide.toDouble(),
                      parent: widget,
                    ),
                  ),
                ),
                Transform.translate(
                  offset:
                      Offset(maxSlide * widget.animationController!.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, .001)
                      ..rotateY(
                          -math.pi / 2 * widget.animationController!.value),
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
        ),
      ),
    );
  }

  void toggle() => widget.animationController!.isDismissed
      ? widget.animationController!.forward()
      : widget.animationController!.reverse();

  void _onDragStart(DragStartDetails details) {
    var isDragOpenFromLeft = widget.animationController!.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    var isDragCloseFromRight = widget.animationController!.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      var delta = details.primaryDelta! / maxSlide;
      widget.animationController!.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (widget.animationController!.isDismissed ||
        widget.animationController!.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      var visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      widget.animationController!.fling(velocity: visualVelocity);
    } else if (widget.animationController!.value < .5) {
      close();
    } else {
      open();
    }
  }

  void close() {
    if (_canBeDragged && widget.animationController!.isCompleted) toggle();
  }

  void open() {
    if (_canBeDragged && widget.animationController!.isDismissed) toggle();
  }
}
