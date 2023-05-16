import 'package:auto_size_text/auto_size_text.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class MobileInterestsView extends StatelessWidget {
  const MobileInterestsView({
    super.key,
    required this.interestModels,
  });

  final List<InterestModel> interestModels;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return PageContainer.mobile(
      child: Column(
        children: [
          CenterLeft(
            child: AutoSizeText(
              'Interests',
              style: appTheme.textTheme.displaySmall,
            ),
          ),
          const Divider(),
          const Gap(16),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: interestModels.length,
                separatorBuilder: (_, __) => const Gap(8),
                itemBuilder: (BuildContext context, int index) {
                  return InterestTile(interestModel: interestModels[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
