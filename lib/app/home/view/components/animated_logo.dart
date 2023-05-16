import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedLogo extends HookWidget {
  const AnimatedLogo({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final rand1 = useState<double>(0);
    final rand2 = useState<double>(0);
    final rand3 = useState<double>(0);
    final rand4 = useState<double>(0);

    useEffect(
      () {
        final timer = Timer.periodic(1.seconds, (timer) {
          rand1.value = random.nextDouble();
          rand2.value = random.nextDouble();
          rand3.value = random.nextDouble();
          rand4.value = random.nextDouble();
        });

        return timer.cancel;
      },
      const [],
    );
    final appTheme = Theme.of(context);

    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            'Hey I am',
            style: appTheme.textTheme.headlineLarge,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: height ?? 256,
              maxWidth: width ?? 800,
            ),
            child: AspectRatio(
              aspectRatio: 8 / 5,
              child: Stack(
                children: [
                  AnimatedPadding(
                    padding: EdgeInsets.only(
                      left: rand1.value * 12,
                      right: rand2.value * 12,
                      bottom: rand3.value * 12,
                      top: rand4.value * 12,
                    ),
                    duration: 1.seconds,
                    child: const Image(
                      image: AssetImage('assets/images/logo-wbg.png'),
                    ),
                  ),
                  AnimatedPadding(
                    padding: EdgeInsets.only(
                      left: rand3.value * 12,
                      right: rand4.value * 12,
                      bottom: rand1.value * 12,
                      top: rand2.value * 12,
                    ),
                    duration: 1.seconds,
                    child: const Image(
                      image: AssetImage('assets/images/logo-wbg.png'),
                    ),
                  ),
                  Image.asset('assets/images/logo-outline.png'),
                ],
              ),
            ),
          ),
          AutoSizeText(
            'Software Engineer',
            style: appTheme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
