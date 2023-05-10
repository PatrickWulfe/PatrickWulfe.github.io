import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScrollCubit>(
      create: (context) => ScrollCubit(),
      child: const RootView(),
    );
  }
}

class RootView extends HookWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final controller = AutoScrollController();
    final pages = <Widget>[
      const HomePage(),
      const AboutMePage(),
      const ProjectsPage(),
      const InterestsPage(),
    ];
    final bloc = context.read<AppBloc>();
    final scrollCubit = context.read<ScrollCubit>();

    return SafeArea(
      child: Scaffold(
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final scrollDirection = notification.direction;
            if (scrollDirection == ScrollDirection.reverse) {
              scrollCubit.scrollBack();
            } else if (scrollDirection == ScrollDirection.forward) {
              scrollCubit.scrollForward();
            }
            return true;
          },
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              final controller = AutoScrollController();
              return Container(
                height: sizingInformation.screenSize.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF16161c),
                      Color(0xFF1c1e26),
                      Color(0xFF2e303e),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    // AppBar
                    BlocBuilder<ScrollCubit, ScrollDirection>(
                      builder: (context, state) {
                        final isScrollingUp = state == ScrollDirection.reverse;
                        return AnimatedOpacity(
                          opacity: isScrollingUp ? 1 : 0,
                          duration: const Duration(milliseconds: 400),
                          child: ActionBar(
                            controller: controller,
                          ),
                        );
                      },
                    ),
                    // Body
                    Expanded(
                      child: Row(
                        children: [
                          if (!sizingInformation.isMobile) const LeftPane(),
                          Expanded(
                            flex: 8,
                            child: ListView(
                              controller: controller,
                              children: [
                                AutoScrollTag(
                                  key: const ValueKey(0),
                                  controller: controller,
                                  index: 0,
                                  child: const HomePage(),
                                ),
                                AutoScrollTag(
                                  key: const ValueKey(1),
                                  controller: controller,
                                  index: 1,
                                  child: const AboutMePage(),
                                ),
                                AutoScrollTag(
                                  key: const ValueKey(2),
                                  controller: controller,
                                  index: 2,
                                  child: const ProjectsPage(),
                                ),
                                AutoScrollTag(
                                  key: const ValueKey(3),
                                  controller: controller,
                                  index: 3,
                                  child: const InterestsPage(),
                                ),
                              ],
                            ),
                          ),
                          if (!sizingInformation.isMobile) const RightPane(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
