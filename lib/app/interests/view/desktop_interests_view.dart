import 'package:auto_size_text/auto_size_text.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class DesktopInterestsView extends StatelessWidget {
  const DesktopInterestsView({
    super.key,
    required this.interestModels,
  });

  final List<InterestModel> interestModels;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return PageContainer.desktop(
      child: Column(
        children: [
          CenterLeft(
            child: AutoSizeText(
              'Interests',
              style: appTheme.textTheme.displayMedium,
            ),
          ),
          const Divider(),
          const Gap(32),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
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
          ),
        ],
      ),
    );
  }
}
