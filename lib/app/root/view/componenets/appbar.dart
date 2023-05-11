import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ActionBar extends StatelessWidget with PreferredSizeWidget {
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
    const pageAnimationDuration = Duration(milliseconds: 400);
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
                              const SizedBox(width: 8),
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
                              const SizedBox(width: 8),
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
                              const SizedBox(width: 8),
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
                              const SizedBox(width: 8),
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
                              const SizedBox(width: 8),
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
                    const SizedBox(width: 32),
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
            const SizedBox.square(dimension: 16),
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
                  InkWell(
                    onTap: () => controller.animateToPage(
                      0,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    child: Row(
                      children: const [
                        SizedBox(width: 32),
                        Icon(Icons.home_rounded),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.animateToPage(
                      1,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 32),
                        Text(
                          '01. ',
                          style: buttonStyle,
                        ),
                        Text(
                          'About Me',
                          style: buttonStyle,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.animateToPage(
                      2,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 32),
                        Text(
                          '02. ',
                          style: buttonStyle,
                        ),
                        Text(
                          'Experience',
                          style: buttonStyle,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.animateToPage(
                      3,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 32),
                        Text(
                          '03. ',
                          style: buttonStyle,
                        ),
                        Text(
                          'Projects',
                          style: buttonStyle,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.animateToPage(
                      4,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 32),
                        Text(
                          '04. ',
                          style: buttonStyle,
                        ),
                        Text(
                          'Interests',
                          style: buttonStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 128),
          ],
        );
      },
    );
  }
}
