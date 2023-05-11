import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => const DesktopExperienceView(),
      tablet: (context) => const TabletExperienceView(),
      mobile: (context) => const MobileExperienceView(),
    );
  }
}
