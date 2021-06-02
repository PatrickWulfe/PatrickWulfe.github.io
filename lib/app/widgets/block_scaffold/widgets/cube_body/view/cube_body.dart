import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_webapp/education/education.dart';
import 'package:portfolio_webapp/experience/experience.dart';
import 'package:portfolio_webapp/home/home.dart';
import 'package:portfolio_webapp/projects/projects.dart';

import '../../../../../app.dart';
import '../../../block_scaffold.dart';

class CubeBody extends StatelessWidget {
  const CubeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CubeBodyBloc(),
      child: const CubeBodyWidget(),
    );
  }
}

class CubeBodyWidget extends StatefulWidget {
  const CubeBodyWidget({Key? key}) : super(key: key);

  @override
  _CubeBodyState createState() => _CubeBodyState();
}

/// Basic idea is to have it zoom out and rotate to whichever page like a cube
class _CubeBodyState extends State<CubeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    var cubeBloc = BlocProvider.of<CubeBodyBloc>(context);
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state is AppPageTransitioning) {
          // _padding = state.zoomedOut ? 20.0 : 0.0;
          cubeBloc.add(CubePageSelected(selectedIndex: 0));
        }
      },
      child: AnimatedPadding(
        padding: EdgeInsets.all(0),
        duration: zoomDuration,
        child: Stack(
          children: const [
            // ExperiencePage(),
            // EducationPage(),
            // ProjectsPage(),
            HomePage(),
          ],
        ),
      ),
    );
  }
}
