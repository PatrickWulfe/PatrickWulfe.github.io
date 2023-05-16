import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    return PageContainer.desktop(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CenterLeft(
            child: Text(
              'Experience',
              style: appTheme.textTheme.displayMedium,
            ),
          ),
          const Divider(),
          const Gap(32),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: ExperienceTile.desktop(
                    experienceModel: experienceModels[0],
                  ),
                ),
                const Gap(16),
                Flexible(
                  child: ExperienceTile.desktop(
                    experienceModel: experienceModels[1],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
