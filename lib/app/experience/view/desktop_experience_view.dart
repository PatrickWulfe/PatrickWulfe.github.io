import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class DesktopExperienceView extends StatelessWidget {
  const DesktopExperienceView({
    super.key,
    required this.experienceModels,
  });

  final List<ExperienceModel> experienceModels;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: ExperienceTile.big(
              experienceModel: experienceModels[0],
            ),
          ),
          const SizedBox.square(dimension: 16),
          Expanded(
            child: ExperienceTile.big(
              experienceModel: experienceModels[1],
            ),
          ),
        ],
      ),
    );
  }
}
