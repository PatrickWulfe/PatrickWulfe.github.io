import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      const ProjectsPage(),
      const InterestsPage(),
    ];
    final bloc = context.read<AppBloc>();
    final scrollCubit = context.read<ScrollCubit>();

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
                            controller: pageController,
                          ),
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
                            child: PageView(
                              scrollDirection: Axis.vertical,
                              controller: pageController,
                              children: pages,
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
    Key? key,
    required this.isMobile,
  }) : super(key: key);

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
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return const SizedBox();
    }
    return const RightPane();
  }
}
