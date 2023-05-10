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
                          value: 3,
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
                    // onTap: () => controller.scrollToIndex(
                    //   0,
                    //   preferPosition: AutoScrollPosition.begin,
                    // ),
                    onHover: (hovered) => null,
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
                    // onTap: () => controller.scrollToIndex(
                    //   1,
                    //   preferPosition: AutoScrollPosition.begin,
                    // ),
                    onHover: (hovered) => null,
                    child: Row(
                      children: const [
                        SizedBox(width: 32),
                        Text(
                          '01. ',
                        ),
                        Text('About Me'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.animateToPage(
                      2,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    // onTap: () => controller.scrollToIndex(
                    //   2,
                    //   preferPosition: AutoScrollPosition.begin,
                    // ),
                    onHover: (hovered) => null,
                    child: Row(
                      children: const [
                        SizedBox(width: 32),
                        Text(
                          '02. ',
                        ),
                        Text('Projects'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.animateToPage(
                      3,
                      duration: pageAnimationDuration,
                      curve: pageAnimationCurve,
                    ),
                    // onTap: () => controller.scrollToIndex(
                    //   3,
                    //   preferPosition: AutoScrollPosition.begin,
                    // ),
                    onHover: (hovered) => null,
                    child: Row(
                      children: const [
                        SizedBox(width: 32),
                        Text(
                          '03. ',
                        ),
                        Text('Interests'),
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
