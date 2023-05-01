import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_project/src/app/app_index.dart';

class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterestsBloc(),
      child: const InterestsView(),
    );
  }
}

class InterestsView extends StatelessWidget {
  const InterestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interests'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Under Construction'),
            Image.asset('assets/images/nyan.gif'),
          ],
        ),
      ),
    );
  }
}
