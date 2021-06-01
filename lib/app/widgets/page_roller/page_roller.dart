import 'dart:math' as math;
import 'package:flutter/material.dart';

class PageRoller extends StatefulWidget {
  const PageRoller({
    Key? key,
    required this.previousPage,
    required this.nextPage,
  }) : super(key: key);

  final Widget previousPage;
  final Widget nextPage;

  @override
  _PageRollerState createState() => _PageRollerState();
}

class _PageRollerState extends State<PageRoller>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, .002)
                  ..rotateX(math.pi / 2 * _controller.value),
                alignment: Alignment.topCenter,
                child: widget.previousPage,
              ),
            ),
            // Container(
            //   alignment: Alignment.topCenter,
            //   child: Transform(
            //     transform: Matrix4.identity(),
            //     child: widget.nextPage,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
