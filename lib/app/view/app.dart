// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:math' as math;
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio_webapp/app/theme.dart';
import 'package:portfolio_webapp/l10n/l10n.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../app.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: portfolioTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => true,
          ),
          title: Image.asset(
            'images/header-logo.png',
            fit: BoxFit.contain,
          ),
        ),
        body: Stack(
          children: const [
            Background(),
            FlowBuilder<String>(
              state: '/',
              onGeneratePages: onGenerateAppViewPages,
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),
        RotatedBox(
          quarterTurns: 1,
          child: WaveWidget(
            config: CustomConfig(
              heightPercentages: [.4, .42, .43],
              durations: [35000, 13370, 19440],
              gradients: [
                [Colors.cyan.withAlpha(200), Colors.cyanAccent],
                [Colors.black26, Colors.cyanAccent],
                [Colors.purple.withAlpha(150), Colors.purpleAccent],
              ],
            ),
            size: const Size(
              double.infinity,
              double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
