import 'dart:math';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_project/src/app/home/home_index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(
        duration: Duration(milliseconds: 250),
      ),
    );
  }
}

class HomeView extends HookWidget {
  const HomeView({
    super.key,
    required this.duration,
  });

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final appTheme = Theme.of(context);

        final children = [
          HomeCard(
            cardIcon: Icons.info,
            description: 'This page contains everything you could '
                'want to know about me and more.',
            buttonText: 'About Me',
            onButtonPress: () => Navigator.pushNamed(context, '/about_me'),
          ),
          HomeCard(
            cardIcon: CommunityMaterialIcons.github,
            description:
                "Here you can find a list of various things I'm working on.",
            buttonText: 'Projects',
            onButtonPress: () => Navigator.pushNamed(context, '/projects'),
          ),
          HomeCard(
            cardIcon: CommunityMaterialIcons.lightbulb,
            description: 'Some of the things I like to do in my spare time.',
            buttonText: 'Interests',
            onButtonPress: () => Navigator.pushNamed(context, '/interests'),
          ),
        ];

        return Scaffold(
          appBar: AppBar(
            title: const Text('Patrick Wulfe'),
            centerTitle: true,
            flexibleSpace: const Text('Under Construction'),
          ),
          // drawer: Drawer(),
          body: Center(
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Stack(
                      children: [
                        AnimatedPadding(
                          duration: duration,
                          padding: EdgeInsets.only(
                            left: controller.value * 4,
                            right: 4 - (controller.value * 4),
                            top: controller.value * 4,
                            bottom: 4 - (controller.value * 4),
                          ),
                          child: Expanded(
                            child: CircleAvatar(
                              backgroundColor: appTheme.colorScheme.onSurface,
                              radius: 100,
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: CircleAvatar(
                            foregroundImage:
                                const AssetImage('assets/avatar_pic.jpg'),
                            radius: min(
                                  constraints.maxWidth,
                                  constraints.maxHeight,
                                ) *
                                .33,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox.square(dimension: 16),
                  Flexible(
                    flex: 3,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: (constraints.maxWidth > 600)
                          ? GridView.count(
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 2,
                              children: children,
                            )
                          : Column(
                              children: children,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
