import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class MobileExperienceView extends StatelessWidget {
  const MobileExperienceView({
    super.key,
    required this.experienceModels,
  });

  final List<ExperienceModel> experienceModels;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'Experience',
            style: appTheme.textTheme.displaySmall,
          ),
          const Divider(),
          const Gap(8),
          Expanded(
            child: ExperienceTile.small(
              experienceModel: experienceModels[0],
            ),
          ),
          const Gap(8),
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
