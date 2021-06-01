import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio_webapp/app/app.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class FlipDrawer extends StatefulWidget {
  const FlipDrawer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _FlipDrawerState createState() => _FlipDrawerState();
}

class _FlipDrawerState extends State<FlipDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _canBeDragged = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragUpdate: _onDragUpdate,
      onTap: toggle,
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceInOut,
        ),
        builder: (context, child) {
          return Stack(
            children: [
              Transform.translate(
                offset:
                    Offset(maxSlide * 3 * (_animationController.value - 1), 0),
                child: RotatedBox(
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
              ),
              Transform.translate(
                offset: Offset(maxSlide * (_animationController.value - 1), 0),
                child: Transform(
                  transform: Matrix4.identity(),
                  //..setEntry(3, 2, .001)
                  //..rotateY(math.pi / 2 * (1 - _animationController.value)),
                  alignment: Alignment.centerRight,
                  child: NavDrawer(
                    animationController: _animationController,
                    width: maxSlide.toDouble(),
                    parent: widget,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(maxSlide * _animationController.value, 0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, .001)
                    ..rotateY(-math.pi / 2 * _animationController.value),
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
    );
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    var isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    var isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      var delta = details.primaryDelta! / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      var visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < .5) {
      close();
    } else {
      open();
    }
  }

  void close() {
    if (_canBeDragged && _animationController.isCompleted) toggle();
  }

  void open() {
    if (_canBeDragged && _animationController.isDismissed) toggle();
  }
}
