import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class TabletExperienceView extends StatelessWidget {
  const TabletExperienceView({
    super.key,
    required this.experienceModels,
  });

  final List<ExperienceModel> experienceModels;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ExperienceTile.small(
              experienceModel: experienceModels[0],
            ),
          ),
          const SizedBox.square(dimension: 8),
          Expanded(
            child: ExperienceTile.small(
              experienceModel: experienceModels[1],
            ),
          ),
        ],
      ),
    );
  }
}
