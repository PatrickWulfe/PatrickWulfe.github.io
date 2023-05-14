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
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(desktopScreenPadding),
            constraints: const BoxConstraints(maxWidth: 1600),
            child: const Row(
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
      },
    );
  }
}
