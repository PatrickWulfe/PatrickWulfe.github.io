import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_project/l10n/l10n.dart';
import 'package:portfolio_project/src/app/app_index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/about_me': (context) => const AboutMePage(),
            '/interests': (context) => const InterestsPage(),
            '/projects': (context) => const ProjectsPage(),
          },
          theme: state.themeName.themeData,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
