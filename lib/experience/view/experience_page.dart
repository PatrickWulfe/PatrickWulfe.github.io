import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ExperiencePage());

  @override
  Widget build(BuildContext context) {
    return const ExperienceView();
  }
}

class ExperienceView extends StatelessWidget {
  const ExperienceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Stack(
                  children: const [
                    Text('Patrick Wulfe'),
                  ],
                ),
              ),
            ),
            const Text('Software Engineer'),
          ],
        ),
      ),
    );
  }
}
