
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_project/app/app_index.dart';

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
    final appTheme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(bottom: 64),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Interests',
              style: appTheme.textTheme.displayMedium,
            ),
          ),
          const Divider(),
          const Text('Under Construction'),
          Image.asset('assets/images/nyan.gif'),
        ],
      ),
    );
  }
}
