import 'package:auto_size_text/auto_size_text.dart';
import 'package:extra_alignments/extra_alignments.dart';
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
    return PageContainer.mobile(
      child: Column(
        children: [
          CenterLeft(
            child: AutoSizeText(
              'Experience',
              style: appTheme.textTheme.displaySmall,
            ),
          ),
          const Divider(),
          const Gap(16),
          Flexible(
            child: ListView.separated(
              itemCount: experienceModels.length,
              separatorBuilder: (_, __) => const Gap(8),
              itemBuilder: (BuildContext context, int index) {
                return ExperienceTile.mobile(
                  experienceModel: experienceModels[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
