import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
    return ScreenTypeLayout.builder(
      desktop: (context) => const DesktopInterestsView(),
      tablet: (context) => const TabletInterestsView(),
      mobile: (context) => const MobileInterestsView(),
    );
  }
}
