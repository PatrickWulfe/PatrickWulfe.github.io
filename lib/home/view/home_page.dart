import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_webapp/app/app.dart';
import 'package:portfolio_webapp/home/widgets/widgets.dart';

const _animationDuration = Duration(milliseconds: 250);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(
        child: HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return const FlipDrawer(child: HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black)],
      ),
      child: Center(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            widthFactor: 2 / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AnimatedMainLogo(),
                Padding(
                  padding: EdgeInsets.only(bottom: 100.0),
                  child: AnimatedHomeText(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '[Click Here]',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
