import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_project/src/app/app_index.dart';

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
            title: 'About Me',
            description: 'This page contains everything you could '
                'want to know about me and more.',
            buttonText: 'Click Here',
            onButtonPress: () => Navigator.pushNamed(context, '/about_me'),
          ),
          HomeCard(
            cardIcon: CommunityMaterialIcons.github,
            title: 'Projects',
            description:
                "Here you can find a list of various things I'm working on.",
            buttonText: 'Click Here',
            onButtonPress: () => Navigator.pushNamed(context, '/projects'),
          ),
          HomeCard(
            cardIcon: CommunityMaterialIcons.lightbulb,
            title: 'Interests',
            description: 'Some of the things I like to do in my spare time.',
            buttonText: 'Click Here',
            onButtonPress: () => Navigator.pushNamed(context, '/interests'),
          ),
        ];

        final bloc = context.read<AppBloc>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Under Construction'),
            centerTitle: true,
            actions: [
              TextButton.icon(
                onPressed: () {
                  bloc.add(const AppEvent.themeSwapped());
                },
                icon: Icon(
                  Icons.brightness_3,
                  color: appTheme.colorScheme.onSurface,
                ),
                label: const Text(''),
              ),
            ],
          ),
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
    return FractionallySizedBox(
      widthFactor: 1,
      child: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1800),
          // padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox.square(dimension: 128),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AnimatedLogo(),
                  SizedBox.square(dimension: 16),
                  _CircleImage(),
                ],
              ),
              const SizedBox.square(dimension: 16),
              Wrap(
                alignment: WrapAlignment.center,
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
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileHomeView extends StatelessWidget {
  const _MobileHomeView({
    super.key,
    required this.children,
  });

  final List<HomeCard> children;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox.square(dimension: 64),
            const _CircleImage(),
            const AnimatedLogo(),
            const SizedBox.square(dimension: 16),
            Wrap(
              alignment: WrapAlignment.center,
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

class _CircleImage extends StatelessWidget {
  const _CircleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      constraints: const BoxConstraints(maxWidth: 400),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/images/avatar_pic.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
