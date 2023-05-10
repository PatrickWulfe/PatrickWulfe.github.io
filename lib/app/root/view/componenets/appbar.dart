import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ActionBar extends StatelessWidget with PreferredSizeWidget {
  const ActionBar({
    super.key,
    required this.controller,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  final AutoScrollController controller;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
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
                    PopupMenuButton(
                      itemBuilder: (c) => <PopupMenuEntry<String>>[
                        PopupMenuItem(
                          child: SizedBox(
                            width: 84,
                            child: InkWell(
                              onTap: () => controller.scrollToIndex(
                                0,
                                preferPosition: AutoScrollPosition.begin,
                              ),
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
                          ),
                        ),
                        PopupMenuItem(
                          child: SizedBox(
                            width: 84,
                            child: InkWell(
                              onTap: () => controller.scrollToIndex(
                                1,
                                preferPosition: AutoScrollPosition.begin,
                              ),
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
                          ),
                        ),
                        PopupMenuItem(
                          child: InkWell(
                            onTap: () => controller.scrollToIndex(
                              2,
                              preferPosition: AutoScrollPosition.begin,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_circle_rounded,
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
                        ),
                        PopupMenuItem(
                          child: InkWell(
                            onTap: () => controller.scrollToIndex(
                              3,
                              preferPosition: AutoScrollPosition.begin,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_circle_rounded,
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
              child: SizedBox(
                width: sizingInformation.screenSize.width * .07,
                height: sizingInformation.screenSize.height * .07,
                child: Image.asset('images/header-logo.png'),
              ),
            ),
            Expanded(
              flex: 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => controller.scrollToIndex(
                      0,
                      preferPosition: AutoScrollPosition.begin,
                    ),
                    onHover: (hovered) => null,
                    child: Row(
                      children: const [
                        SizedBox(width: 32),
                        Icon(Icons.home_rounded),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.scrollToIndex(
                      1,
                      preferPosition: AutoScrollPosition.begin,
                    ),
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
                    onTap: () => controller.scrollToIndex(
                      2,
                      preferPosition: AutoScrollPosition.begin,
                    ),
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
                    onTap: () => controller.scrollToIndex(
                      3,
                      preferPosition: AutoScrollPosition.begin,
                    ),
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
