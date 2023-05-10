import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
            description: '''
Here you can find a list of all my GitHub repositories in a tracker I'm building.''',
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
        return Center(
          child: ResponsiveBuilder(
            builder:
                (BuildContext context, SizingInformation sizingInformation) {
              if (sizingInformation.isDesktop) {
                return _DesktopHomeView(children: children);
              }
              return _MobileHomeView(children: children);
            },
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
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: sizingInformation.screenSize.width * .1,
          // ),
          padding: const EdgeInsets.only(bottom: 64),
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1800),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
          children: const [
            SizedBox.square(dimension: 64),
            _CircleImage(
              width: 300,
            ),
            AnimatedLogo(
              height: 200,
            ),
            SizedBox.square(dimension: 16),
            // Wrap(
            // alignment: WrapAlignment.center,
            // children: children
            //     .map(
            //       (e) => Container(
            //         constraints: const BoxConstraints(
            //           maxWidth: 400,
            //           maxHeight: 300,
            //         ),
            //         padding: const EdgeInsets.all(8),
            //         child: e,
            //       ),
            //     )
            //     .toList(),
            // ),
            SizedBox.square(dimension: 16),
          ],
        ),
      ),
    );
  }
}

class _CircleImage extends StatelessWidget {
  const _CircleImage({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      constraints: BoxConstraints(maxWidth: width ?? 400),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/images/avatar_pic.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
