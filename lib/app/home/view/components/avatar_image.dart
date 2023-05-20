import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      constraints: BoxConstraints(maxWidth: width ?? 400),
      clipBehavior: Clip.antiAlias,
      child: ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
          ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
        },
        blendMode: BlendMode.dstIn,
        child: Image.asset(
          'assets/images/avatar_pic.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
