import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_webapp/home/widgets/widgets.dart';

final _animationDuration = const Duration(milliseconds: 250);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Image.asset(
          'images/header-logo.png',
          fit: BoxFit.contain,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 1600,
              child: AnimatedMainLogo(),
            ),
            const AnimatedHomeText(),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

class AnimatedHomeText extends StatelessWidget {
  const AnimatedHomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'Software Engineer',
          textStyle: Theme.of(context).textTheme.headline2,
          speed: _animationDuration,
        ),
        TypewriterAnimatedText(
          'Recent Gradutate',
          textStyle: Theme.of(context).textTheme.headline2,
          speed: _animationDuration,
        ),
        TypewriterAnimatedText(
          'All-Around Cool Dude',
          textStyle: Theme.of(context).textTheme.headline2,
          speed: _animationDuration,
        ),
      ],
    );
  }
}
