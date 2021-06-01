import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_webapp/app/app.dart';
import 'package:portfolio_webapp/projects/projects.dart';

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
                    return;
                  },
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Projects'),
                  onTap: () {
                    // context.flow<String>().update((e) => '/projects');
                    widget.parent.createState().close();
                    appBloc.add(AppPageSelected(
                      prevPage: appBloc.state.currentPage,
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
                    context.flow<String>().update((e) => '/education');
                  },
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                  title: const Text('Experience'),
                  onTap: () {
                    context.flow<String>().update((e) => '/experience');
                  },
                ),
              ),
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
