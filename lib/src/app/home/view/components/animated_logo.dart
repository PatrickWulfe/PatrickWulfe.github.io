import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
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
    final controller = useAnimationController();
    final random = Random();
    final rand1 = useState<double>(0);
    final rand2 = useState<double>(0);
    final rand3 = useState<double>(0);
    final rand4 = useState<double>(0);

    useEffect(
      () {
        final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          rand1.value = random.nextDouble();
          rand2.value = random.nextDouble();
          rand3.value = random.nextDouble();
          rand4.value = random.nextDouble();
        });

        return timer.cancel;
      },
      const [],
    );

    return Container(
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
              duration: const Duration(seconds: 1),
              child:
                  const Image(image: AssetImage('assets/images/logo-wbg.png')),
            ),
            AnimatedPadding(
              padding: EdgeInsets.only(
                left: rand3.value * 12,
                right: rand4.value * 12,
                bottom: rand1.value * 12,
                top: rand2.value * 12,
              ),
              duration: const Duration(seconds: 1),
              child:
                  const Image(image: AssetImage('assets/images/logo-wbg.png')),
            ),
            Image.asset('assets/images/logo-outline.png'),
          ],
        ),
      ),
    );
  }
}
