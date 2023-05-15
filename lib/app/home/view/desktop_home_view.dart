import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class DesktopHomeView extends StatelessWidget {
  const DesktopHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PageContainer.desktop(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              flex: 3,
              child: AnimatedLogo(),
            ),
            Gap(16),
            Expanded(
              flex: 3,
              child: AvatarImage(),
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
