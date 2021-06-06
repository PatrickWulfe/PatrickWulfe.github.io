import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_webapp/app/app.dart';
import 'package:portfolio_webapp/app/widgets/block_scaffold/block_scaffold.dart';
import 'package:portfolio_webapp/dotfiles/dotfiles.dart';
import 'package:portfolio_webapp/education/education.dart';
import 'package:portfolio_webapp/experience/experience.dart';
import 'package:portfolio_webapp/projects/projects.dart';

import '../flip_drawer.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({
    required this.width,
    required this.animationController,
    required this.parent,
    Key? key,
  }) : super(key: key);

  final double width;
  final AnimationController animationController;
  final FlipDrawer parent;
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    var appBloc = BlocProvider.of<AppBloc>(context);
    return SizedBox(
      width: widget.width,
      child: Stack(
        children: [
          const DrawerBackground(),
          Column(
            children: [
              Card(
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    widget.animationController.reverse();
                  },
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Projects'),
                  onTap: () {
                    appBloc.add(AppPageSelected(
                      prevPage: widget,
                      newPage: const ProjectsPage(),
                    ));
                  },
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Education'),
                  onTap: () {
                    appBloc.add(AppPageSelected(
                      prevPage: widget,
                      newPage: const EducationPage(),
                    ));
                  },
                ),
              ),
              Card(
                // context.flow<String>().update((e) => '/projects');
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Experience'),
                  onTap: () {
                    appBloc.add(AppPageSelected(
                      prevPage: widget,
                      newPage: const ExperiencePage(),
                    ));
                  },
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                  title: const Text('.dotfiles'),
                  onTap: () {
                    appBloc.add(AppPageSelected(
                      prevPage: widget,
                      newPage: const DotfilesPage(),
                    ));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerBackground extends StatelessWidget {
  const DrawerBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topCenter,
          colors: [
            Colors.cyanAccent.shade700,
            Colors.purpleAccent.shade700,
          ],
        ),
      ),
    );
  }
}
