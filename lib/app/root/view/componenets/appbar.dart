import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ActionBar extends StatelessWidget implements PreferredSizeWidget {
  const ActionBar({
    super.key,
    required this.controller,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  // final AutoScrollController controller;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final pageAnimationDuration = .4.seconds;
    const pageAnimationCurve = Curves.ease;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isMobile || sizingInformation.isTablet) {
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 12,
                  ),
                  child: Image.asset(
                    'images/header-logo.png',
                    width: sizingInformation.screenSize.width * .05,
                    height: sizingInformation.screenSize.height * .05,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton<int>(
                      onSelected: (value) => controller.animateToPage(
                        value,
                        duration: pageAnimationDuration,
                        curve: pageAnimationCurve,
                      ),
                      itemBuilder: (c) => <PopupMenuEntry<int>>[
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.home_rounded,
                                size: 18,
                              ),
                              const Gap(8),
                              Text(
                                'Home',
                                style: appTheme.textTheme.labelMedium,
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.account_circle_rounded,
                                size: 18,
                              ),
                              const Gap(8),
                              Text(
                                'About Me',
                                style: appTheme.textTheme.labelMedium,
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.assignment_rounded,
                                size: 18,
                              ),
                              const Gap(8),
                              Text(
                                'Experience',
                                style: appTheme.textTheme.labelMedium,
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Row(
                            children: [
                              const Icon(
                                CommunityMaterialIcons.github,
                                size: 18,
                              ),
                              const Gap(8),
                              Text(
                                'Projects',
                                style: appTheme.textTheme.labelMedium,
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 4,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.lightbulb_rounded,
                                size: 18,
                              ),
                              const Gap(8),
                              Text(
                                'Interests',
                                style: appTheme.textTheme.labelMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                      child: const Icon(Icons.menu_rounded, size: 24),
                    ),
                    const Gap(32),
                  ],
                ),
              ),
            ],
          );
        }
        // ELSE
        final buttonStyle = appTheme.textTheme.labelLarge;
        return Row(
          children: [
            const Gap(16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 12,
                ),
                child: Image.asset(
                  'images/header-logo.png',
                  width: sizingInformation.screenSize.width * .10,
                  height: sizingInformation.screenSize.height * .10,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () => controller.animateToPage(
                      0,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    icon: const Icon(Icons.home_rounded),
                    label: const Text('Home'),
                  ),
                  const Gap(8),
                  TextButton.icon(
                    onPressed: () => controller.animateToPage(
                      1,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    icon: const Icon(Icons.info),
                    label: const Text('About Me'),
                  ),
                  const Gap(8),
                  TextButton.icon(
                    onPressed: () => controller.animateToPage(
                      2,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    icon: const Icon(Icons.book_rounded),
                    label: const Text('Experience'),
                  ),
                  const Gap(8),
                  TextButton.icon(
                    onPressed: () => controller.animateToPage(
                      3,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    icon: const Icon(CommunityMaterialIcons.github),
                    label: const Text('Projects'),
                  ),
                  const Gap(8),
                  TextButton.icon(
                    onPressed: () => controller.animateToPage(
                      4,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    icon: const Icon(Icons.lightbulb_circle_rounded),
                    label: const Text('Interests'),
                  ),
                ],
              ),
            ),
            const Gap(128),
          ],
        );
      },
    );
  }
}
