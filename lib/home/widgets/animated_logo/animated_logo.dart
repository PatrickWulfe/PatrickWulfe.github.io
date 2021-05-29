import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedMainLogo extends StatefulWidget {
  AnimatedMainLogo({Key? key}) : super(key: key);

  @override
  _AnimatedMainLogoState createState() => _AnimatedMainLogoState();
}

class _AnimatedMainLogoState extends State<AnimatedMainLogo> {
  var random = Random();
  final _scale1 = 10;
  final _scale2 = 7;
  var insets1 = EdgeInsets.zero;
  var insets2 = EdgeInsets.zero;

  void changePosition(Timer t) async {
    setState(() {
      insets1 = EdgeInsets.only(
        left: random.nextDouble() * _scale1,
        top: random.nextDouble() * _scale1,
        right: random.nextDouble() * _scale1,
        bottom: random.nextDouble() * _scale1,
      );
      insets2 = EdgeInsets.only(
        left: random.nextDouble() * _scale2,
        top: random.nextDouble() * _scale2,
        right: random.nextDouble() * _scale2,
        bottom: random.nextDouble() * _scale2,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), changePosition);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 4 / 5,
      child: Stack(
        children: [
          AnimatedPadding(
            duration: const Duration(seconds: 1),
            padding: insets1,
            child: const Image(
              image: AssetImage('images/logo-wbg.png'),
              color: Colors.white,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          AnimatedPadding(
            duration: const Duration(seconds: 1),
            padding: insets2,
            child: const Image(
              image: AssetImage('images/logo-wbg.png'),
              color: Colors.white,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          const Image(
            image: AssetImage('images/logo-outline.png'),
          ),
        ],
      ),
    );
  }
}
