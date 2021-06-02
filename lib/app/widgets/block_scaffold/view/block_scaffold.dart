import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_webapp/app/widgets/block_scaffold/block_scaffold.dart';

class BlockScaffold extends StatelessWidget {
  const BlockScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlockScaffoldCubit(),
      child: const BlockScaffoldWidget(),
    );
  }
}

class BlockScaffoldWidget extends StatefulWidget {
  const BlockScaffoldWidget({Key? key}) : super(key: key);

  @override
  _BlockScaffoldWidgetState createState() => _BlockScaffoldWidgetState();
}

class _BlockScaffoldWidgetState extends State<BlockScaffoldWidget>
    with TickerProviderStateMixin {
  late BlockScaffoldCubit cubit;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BlockScaffoldCubit>(context)
      ..setToggleController(
          AnimationController(vsync: this, duration: toggleDuration))
      ..setRollController(
          AnimationController(vsync: this, duration: rollDuration))
      ..setZoomController(
          AnimationController(vsync: this, duration: zoomDuration));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarPulltab(),
      ),
      body: const CubeBody(),
    );
  }
}
