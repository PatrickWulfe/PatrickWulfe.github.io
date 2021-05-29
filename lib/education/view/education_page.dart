import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: EducationPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const EducationView(),
    );
  }
}

class EducationView extends StatelessWidget {
  const EducationView({Key? key}) : super(key: key);

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
                  children: [
                    const Text('Patrick Wulfe'),
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
