import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_webapp/app/app.dart';
import 'package:portfolio_webapp/app/widgets/block_scaffold/block_scaffold.dart';
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
                shadowColor: Colors.black38,
                elevation: 8,
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    return;
                  },
                ),
              ),
              Card(
                shadowColor: Colors.black38,
                elevation: 8,
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Projects (working)'),
                  onTap: () {
                    // context.flow<String>().update((e) => '/projects');
                    appBloc.add(AppPageSelected(
                        prevPage: widget, newPage: const ProjectsPage()));
                  },
                ),
              ),
              Card(
                shadowColor: Colors.black38,
                elevation: 8,
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Education'),
                  onTap: () {
                    context.flow<String>().update((e) => '/education');
                  },
                ),
              ),
              Card(
                shadowColor: Colors.black38,
                elevation: 8,
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Experience'),
                  onTap: () {
                    context.flow<String>().update((e) => '/experience');
                  },
                ),
              ),
              Card(
                shadowColor: Colors.black38,
                elevation: 8,
                color: Colors.white10,
                child: ListTile(
                  title: const Text('.dotfiles'),
                  onTap: () {
                    return;
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
