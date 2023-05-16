import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class ExperienceTile extends StatelessWidget {
  const ExperienceTile({
    super.key,
    required this.experienceModel,
    required this.logoHeight,
    required this.includeBulletPoints,
    required this.descriptionMaxLines,
  });

  const factory ExperienceTile.desktop({
    required ExperienceModel experienceModel,
  }) = _DesktopExperienceTile;

  const factory ExperienceTile.tablet({
    required ExperienceModel experienceModel,
  }) = _TabletExperienceTile;

  const factory ExperienceTile.mobile({
    required ExperienceModel experienceModel,
  }) = _MobileExperienceTile;

  final ExperienceModel experienceModel;
  final double logoHeight;
  final bool includeBulletPoints;
  final int descriptionMaxLines;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: appTheme.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          SizedBox(
            height: logoHeight * 1.5,
            child: Center(
              child: Image.asset(
                experienceModel.logoAssetName,
                height: logoHeight,
              ),
            ),
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  experienceModel.companyName,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: appTheme.textTheme.headlineMedium,
                ),
              ),
              const Gap(8),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  experienceModel.dateRange,
                ),
              ),
            ],
          ),
          FittedBox(
            child: Text(
              experienceModel.jobTitle,
              style: appTheme.textTheme.headlineSmall,
            ),
          ),
          const Gap(8),
          if (!includeBulletPoints)
            Expanded(
              child: Text(
                experienceModel.description,
                overflow: TextOverflow.fade,
                maxLines: descriptionMaxLines,
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                experienceModel.description,
                overflow: TextOverflow.ellipsis,
                maxLines: descriptionMaxLines,
              ),
            ),
          if (includeBulletPoints)
            Expanded(
              child: Text(
                experienceModel.bulletPoints,
                softWrap: true,
              ),
            ),
          if (!includeBulletPoints) const Expanded(child: SizedBox()),
          if (!includeBulletPoints)
            BottomRight(
              child: FilledButton(
                onPressed: () {},
                child: const Text('View More...'),
              ),
            ),
        ],
      ),
    );
  }
}

class _DesktopExperienceTile extends ExperienceTile {
  const _DesktopExperienceTile({
    required super.experienceModel,
  }) : super(
          logoHeight: 80,
          includeBulletPoints: true,
          descriptionMaxLines: 9999,
        );
}

class _TabletExperienceTile extends ExperienceTile {
  const _TabletExperienceTile({
    required super.experienceModel,
  }) : super(
          logoHeight: 60,
          includeBulletPoints: true,
          descriptionMaxLines: 8,
        );
}

class _MobileExperienceTile extends ExperienceTile {
  const _MobileExperienceTile({
    required super.experienceModel,
  }) : super(
          logoHeight: 20,
          includeBulletPoints: false,
          descriptionMaxLines: 3,
        );

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: appTheme.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          SizedBox(
            height: logoHeight,
            child: Center(
              child: Image.asset(
                experienceModel.logoAssetName,
                height: logoHeight,
              ),
            ),
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  experienceModel.companyName,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: appTheme.textTheme.headlineMedium,
                ),
              ),
              const Gap(8),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  experienceModel.dateRange,
                ),
              ),
            ],
          ),
          FittedBox(
            child: Text(
              experienceModel.jobTitle,
              style: appTheme.textTheme.headlineSmall,
            ),
          ),
          const Gap(8),
          if (!includeBulletPoints)
            Expanded(
              child: Text(
                experienceModel.description,
                overflow: TextOverflow.fade,
                maxLines: descriptionMaxLines,
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                experienceModel.description,
                overflow: TextOverflow.ellipsis,
                maxLines: descriptionMaxLines,
              ),
            ),
          if (includeBulletPoints)
            Expanded(
              child: Text(
                experienceModel.bulletPoints,
                softWrap: true,
              ),
            ),
          if (!includeBulletPoints) const Expanded(child: SizedBox()),
          if (!includeBulletPoints)
            BottomRight(
              child: FilledButton(
                onPressed: () {},
                child: const Text('View More...'),
              ),
            ),
        ],
      ),
    );
  }
}
