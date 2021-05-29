import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ProjectsPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const ProjectsView(),
    );
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key}) : super(key: key);

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
