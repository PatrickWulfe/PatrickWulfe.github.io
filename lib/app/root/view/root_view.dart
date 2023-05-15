import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
    final pages = <Widget>[
      const HomePage(),
      const AboutMePage(),
      const ExperiencePage(),
      const ProjectsPage(),
      const InterestsPage(),
    ];
    final scrollCubit = context.read<ScrollCubit>();
    // init projects cubit to prevent load times when moving to page.
    GetIt.I.get<ProjectsBloc>().add(const ProjectsEvent.started());

    final pageController = usePageController();

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
              return Container(
                height: sizingInformation.screenSize.height,
                // Background
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      appTheme.extension<GradientColors>()?.firstColor ??
                          const Color(0xFF000000),
                      appTheme.extension<GradientColors>()?.secondColor ??
                          const Color(0xFF000000),
                      appTheme.extension<GradientColors>()?.thirdColor ??
                          const Color(0xFF000000),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    // AppBar
                    BlocBuilder<ScrollCubit, ScrollDirection>(
                      builder: (context, state) {
                        final isScrollingUp = state == ScrollDirection.reverse;
                        return Animate(
                          effects: [
                            FadeEffect(duration: .3.seconds),
                            const SlideEffect()
                          ],
                          target: isScrollingUp ? 0 : 1,
                          child: ActionBar(controller: pageController),
                        );
                      },
                    ),
                    // Body
                    Expanded(
                      child: Row(
                        children: [
                          _LeftPaneWA(isMobile: sizingInformation.isMobile),
                          Expanded(
                            flex: 10,
                            child: FadingEdgeScrollView.fromPageView(
                              child: PageView(
                                scrollDirection: Axis.vertical,
                                controller: pageController,
                                children: pages,
                              ),
                            ),
                          ),
                          _RightPaneWA(isMobile: sizingInformation.isMobile),
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

// workarounds to keep page from rebuilding when resizing to mobile view
class _LeftPaneWA extends StatelessWidget {
  const _LeftPaneWA({
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return const SizedBox();
    }
    return const LeftPane();
  }
}

class _RightPaneWA extends StatelessWidget {
  const _RightPaneWA({
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return const SizedBox();
    }
    return const RightPane();
  }
}
