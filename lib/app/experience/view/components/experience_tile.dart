import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class ExperienceTile extends StatelessWidget {
  const ExperienceTile({
    super.key,
    required this.experienceModel,
    required this.logoHeight,
    required this.includeBulletPoints,
  });

  const factory ExperienceTile.big({
    required ExperienceModel experienceModel,
  }) = _BigExperienceTile;

  const factory ExperienceTile.small({
    required ExperienceModel experienceModel,
  }) = _SmallExperienceTile;

  final ExperienceModel experienceModel;
  final double logoHeight;
  final bool includeBulletPoints;

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
          const SizedBox.square(dimension: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  experienceModel.companyName,
                  style: appTheme.textTheme.displaySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  experienceModel.dateRange,
                ),
              ),
            ],
          ),
          Text(
            experienceModel.jobTitle,
            style: appTheme.textTheme.headlineSmall,
          ),
          Text(experienceModel.description),
          if (includeBulletPoints)
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: experienceModel.bulletPoints.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.circle,
                              size: 4,
                            ),
                          ),
                          const SizedBox.square(dimension: 8),
                          Expanded(
                            child: Text(experienceModel.bulletPoints[index]),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          if (!includeBulletPoints) const Expanded(child: SizedBox()),
          if (!includeBulletPoints)
            Align(
              alignment: Alignment.bottomRight,
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

class _BigExperienceTile extends ExperienceTile {
  const _BigExperienceTile({
    required super.experienceModel,
  }) : super(
          logoHeight: 80,
          includeBulletPoints: true,
        );
}

class _SmallExperienceTile extends ExperienceTile {
  const _SmallExperienceTile({
    required super.experienceModel,
  }) : super(
          logoHeight: 30,
          includeBulletPoints: false,
        );
}
