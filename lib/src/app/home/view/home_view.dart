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
              builder: (context, constraints) {
                if (constraints.maxWidth > 1023) {
                  return _DesktopHomeView(children: children);
                }
                return _MobileHomeView(children: children);
              },
            ),
          ),
        );
      },
    );
  }
}

class _DesktopHomeView extends StatelessWidget {
  const _DesktopHomeView({
    super.key,
    required this.children,
  });

  final List<HomeCard> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const SizedBox.square(dimension: 128),
          Flexible(
            flex: 5,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                AnimatedLogo(),
                SizedBox.square(dimension: 16),
                AspectRatio(
                  aspectRatio: 1,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(
                      'assets/images/avatar_pic.jpg',
                    ),
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 16 / 9,
                    children: children,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileHomeView extends StatelessWidget {
  const _MobileHomeView({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<HomeCard> children;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox.square(dimension: 64),
            const FractionallySizedBox(
              widthFactor: 2 / 3,
              child: AspectRatio(
                aspectRatio: 1,
                child: CircleAvatar(
                  foregroundImage: AssetImage(
                    'assets/images/avatar_pic.jpg',
                  ),
                ),
              ),
            ),
            const AnimatedLogo(),
            const SizedBox.square(dimension: 16),
            Wrap(
              children: children
                  .map(
                    (e) => Container(
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                        maxHeight: 300,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox.square(dimension: 16),
          ],
        ),
      ),
    );
  }
}
