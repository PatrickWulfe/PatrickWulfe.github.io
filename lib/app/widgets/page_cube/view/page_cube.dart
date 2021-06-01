import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_webapp/education/education.dart';
import 'package:portfolio_webapp/experience/experience.dart';
import 'package:portfolio_webapp/home/home.dart';
import 'package:portfolio_webapp/projects/projects.dart';

import '../page_cube.dart';

class PageCube extends StatelessWidget {
  const PageCube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PageCubeBloc(),
      child: const PageCubeWidget(),
    );
  }
}

class PageCubeWidget extends StatefulWidget {
  const PageCubeWidget({Key? key}) : super(key: key);

  @override
  _PageCubeState createState() => _PageCubeState();
}

/// Basic idea is to have it zoom out and rotate to whichever page like a cube
class _PageCubeState extends State<PageCubeWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var _padding = 0.0;
    return BlocListener<PageCubeBloc, PageCubeState>(
      listener: (context, state) {
        if (state is AnimatingTransition) {
          _padding = state.zoomedOut ? 20.0 : 0.0;
        }
      },
      child: AnimatedPadding(
        padding: EdgeInsets.all(_padding),
        duration: zoomDuration,
        child: Stack(
          children: const [
            ExperiencePage(),
            EducationPage(),
            ProjectsPage(),
            HomePage(),
          ],
        ),
      ),
    );
  }
}
