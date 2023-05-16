import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DesktopHomeView extends StatelessWidget {
  const DesktopHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final children = [
      const Flexible(
        flex: 3,
        child: AvatarImage(),
      ),
      const Gap(16),
      const Flexible(
        flex: 3,
        child: AnimatedLogo(),
      ),
    ];
    return Center(
      child: PageContainer.desktop(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.screenSize.aspectRatio > 1) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            );
          },
        ),
      ),
    );
  }
}
