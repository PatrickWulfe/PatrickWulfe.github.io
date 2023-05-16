import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    return PageContainer.tablet(
      child: Column(
        children: [
          CenterLeft(
            child: Text(
              'Experience',
              style: appTheme.textTheme.displayMedium,
            ),
          ),
          const Divider(),
          const Gap(32),
          Expanded(
            child: ExperienceTile.mobile(
              experienceModel: experienceModels[0],
            ),
          ),
          const Gap(8),
          Expanded(
            child: ExperienceTile.mobile(
              experienceModel: experienceModels[1],
            ),
          ),
        ],
      ),
    );
  }
}