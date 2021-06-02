import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_webapp/app/widgets/block_scaffold/block_scaffold.dart';

class AppBarPulltab extends StatefulWidget {
  const AppBarPulltab({Key? key}) : super(key: key);

  final headerLogo = const Image(image: AssetImage('images/header-logo.png'));

  @override
  _AppBarPulltabState createState() => _AppBarPulltabState();
}

class _AppBarPulltabState extends State<AppBarPulltab> {
  double sliderValue = 0;
  bool _canBeDragged = true;
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    _animationController =
        BlocProvider.of<BlockScaffoldCubit>(context).toggleAnimationController!;
    return GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragEnd: _onDragEnd,
        onHorizontalDragUpdate: _onDragUpdate,
        onTap: toggle,
        child: const LogoSlider(
          width: maxSlide + 1000, //widget.headerLogo.width!,),
        ));
  }

  void _onDragStart(DragStartDetails details) {
    var isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    var isDragClosedFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragClosedFromRight;
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

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      var delta = details.primaryDelta! / maxSlide;
      _animationController.value += delta;
    }
  }

  void close() {
    if (_canBeDragged && _animationController.isCompleted) toggle();
  }

  void open() {
    if (_canBeDragged && _animationController.isDismissed) toggle();
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();
}

class LogoSlider extends StatelessWidget {
  const LogoSlider({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    var controller =
        BlocProvider.of<BlockScaffoldCubit>(context).toggleAnimationController!;
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Transform.translate(
            offset: Offset(maxSlide * controller.value, 0),
            child: const Image(image: AssetImage('images/header-logo.png')),
          );
        });
  }
}
