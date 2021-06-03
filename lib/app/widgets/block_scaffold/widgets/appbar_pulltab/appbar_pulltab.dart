import 'package:flutter/material.dart';
import 'package:portfolio_webapp/app/widgets/block_scaffold/block_scaffold.dart';
import 'package:simple_animations/simple_animations.dart';

class AppBarPulltab extends StatefulWidget {
  const AppBarPulltab({
    Key? key,
    required this.controller,
    required this.animation,
  }) : super(key: key);

  final headerLogo = const Image(image: AssetImage('images/header-logo.png'));
  final AnimationController controller;
  final Animation<TimelineValue<DrawerAniProps>> animation;

  @override
  _AppBarPulltabState createState() => _AppBarPulltabState();
}

class _AppBarPulltabState extends State<AppBarPulltab> {
  double sliderValue = 0;
  bool _canBeDragged = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragUpdate: _onDragUpdate,
      onTap: toggle,
      child: LogoSlider(
        animation: widget.animation,
        controller: widget.controller,
        width: maxSlide + 200, //widget.headerLogo.width!,),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    var isDragOpenFromLeft = widget.controller.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    var isDragClosedFromRight = widget.controller.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragClosedFromRight;
  }

  void _onDragEnd(DragEndDetails details) {
    if (widget.controller.isDismissed || widget.controller.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      var visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      widget.controller.fling(velocity: visualVelocity);
    } else if (widget.controller.value < .5) {
      close();
    } else {
      open();
    }
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      var delta = details.primaryDelta! / maxSlide;
      widget.controller.value += delta;
    }
  }

  void close() {
    if (_canBeDragged && widget.controller.isCompleted) toggle();
  }

  void open() {
    if (_canBeDragged && widget.controller.isDismissed) toggle();
  }

  void toggle() => widget.controller.isDismissed
      ? widget.controller.forward()
      : widget.controller.reverse();
}

class LogoSlider extends StatelessWidget {
  const LogoSlider({
    Key? key,
    required this.width,
    required this.animation,
    required this.controller,
  }) : super(key: key);

  final double width;
  final Animation<TimelineValue<DrawerAniProps>> animation;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: controller,
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          width: width,
          child: AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(
                      maxSlide * animation.value.get(DrawerAniProps.slide), 0),
                  child:
                      const Image(image: AssetImage('images/header-logo.png')),
                );
              }),
        ),
      ],
    );
  }
}
