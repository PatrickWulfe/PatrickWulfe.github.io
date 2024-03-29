import 'package:auto_size_text/auto_size_text.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class ExperienceTile extends StatelessWidget {
  const ExperienceTile._({
    super.key,
    required this.experienceModel,
    required this.logoHeight,
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
  final int descriptionMaxLines;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AutoSizeText(
                experienceModel.companyName,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: appTheme.textTheme.headlineLarge,
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: AutoSizeText(
                experienceModel.dateRange,
              ),
            ),
          ],
        ),
        const Gap(16),
        AutoSizeText(
          experienceModel.jobTitle,
          style: appTheme.textTheme.headlineMedium
              ?.copyWith(color: appTheme.colorScheme.tertiary),
        ),
        const Divider(),
        Text(
          experienceModel.description,
          overflow: TextOverflow.ellipsis,
          maxLines: descriptionMaxLines,
          style: appTheme.textTheme.bodyLarge,
        ),
        const Gap(16),
        Flexible(
          child: AutoSizeText(
            experienceModel.bulletPoints,
            softWrap: true,
            style: appTheme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _DesktopExperienceTile extends ExperienceTile {
  const _DesktopExperienceTile({
    required super.experienceModel,
  }) : super._(
          logoHeight: 80,
          descriptionMaxLines: 9999,
        );
}

class _TabletExperienceTile extends ExperienceTile {
  const _TabletExperienceTile({
    required super.experienceModel,
  }) : super._(
          logoHeight: 60,
          descriptionMaxLines: 8,
        );

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AutoSizeText(
                experienceModel.companyName,
                softWrap: false,
                style: appTheme.textTheme.headlineMedium,
              ),
            ),
            const Gap(8),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: AutoSizeText(
                experienceModel.dateRange,
              ),
            ),
          ],
        ),
        AutoSizeText(
          experienceModel.jobTitle,
          style: appTheme.textTheme.headlineSmall
              ?.copyWith(color: appTheme.colorScheme.tertiary),
        ),
        const Gap(8),
        Flexible(
          child: AutoSizeText(
            experienceModel.description,
            overflow: TextOverflow.fade,
            style: appTheme.textTheme.bodyLarge,
          ),
        ),
        const Gap(8),
        Flexible(
          child: AutoSizeText(
            experienceModel.bulletPoints,
            overflow: TextOverflow.fade,
            style: appTheme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _MobileExperienceTile extends ExperienceTile {
  const _MobileExperienceTile({
    required super.experienceModel,
  }) : super._(
          logoHeight: 20,
          descriptionMaxLines: 3,
        );

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AutoSizeText(
                experienceModel.companyName,
                softWrap: false,
                style: appTheme.textTheme.headlineSmall,
              ),
            ),
            const Gap(8),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: AutoSizeText(
                experienceModel.dateRange,
              ),
            ),
          ],
        ),
        AutoSizeText(
          experienceModel.jobTitle,
          style: appTheme.textTheme.labelLarge
              ?.copyWith(color: appTheme.colorScheme.tertiary),
        ),
        const Gap(8),
        Flexible(
          child: AutoSizeText(
            experienceModel.description,
            overflow: TextOverflow.fade,
            style: appTheme.textTheme.bodySmall,
          ),
        ),
        const Gap(8),
        BottomRight(
          child: FilledButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SingleChildScrollView(
                            child: Text(
                              experienceModel.bulletPoints,
                            ),
                          ),
                        ),
                        const Gap(8),
                        FilledButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Back'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            child: const Text('View More...'),
          ),
        ),
      ],
    );
  }
}
