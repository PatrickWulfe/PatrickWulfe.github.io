import 'package:auto_size_text/auto_size_text.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DesktopExperienceView extends StatelessWidget {
  const DesktopExperienceView({
    super.key,
    required this.experienceModels,
  });

  final List<ExperienceModel> experienceModels;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final children = [
      Expanded(
        child: ExperienceTile.desktop(
          experienceModel: experienceModels[0],
        ),
      ),
      const Gap(64),
      Expanded(
        child: ExperienceTile.desktop(
          experienceModel: experienceModels[1],
        ),
      ),
    ];
    return PageContainer.desktop(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CenterLeft(
            child: AutoSizeText(
              'Experience',
              style: appTheme.textTheme.displayMedium,
            ),
          ),
          const Divider(),
          const Gap(32),
          Expanded(
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                if (sizingInformation.screenSize.aspectRatio > 1) {
                  return Row(children: children);
                }
                return ListView.separated(
                  itemCount: experienceModels.length,
                  separatorBuilder: (_, __) => const Gap(64),
                  itemBuilder: (BuildContext context, int index) {
                    return ExperienceTile.tablet(
                      experienceModel: experienceModels[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
