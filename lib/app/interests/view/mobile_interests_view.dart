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
    return Padding(
      padding: const EdgeInsets.all(mobileScreenPadding),
      child: Center(
        child: Column(
          children: [
            CenterLeft(
              child: Text(
                'Interests',
                style: appTheme.textTheme.displaySmall,
              ),
            ),
            const Divider(),
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
      ),
    );
  }
}
