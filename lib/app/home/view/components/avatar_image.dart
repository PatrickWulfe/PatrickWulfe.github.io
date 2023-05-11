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
      child: Image.asset(
        'assets/images/avatar_pic.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
