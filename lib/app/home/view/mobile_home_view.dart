import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PageContainer.mobile(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: AvatarImage(
                  width: 300,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: AnimatedLogo(
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
