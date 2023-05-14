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
    return Padding(
      padding: const EdgeInsets.all(desktopScreenPadding),
      child: Center(
        child: Column(
          children: [
            CenterLeft(
              child: Text(
                'Interests',
                style: appTheme.textTheme.displayMedium,
              ),
            ),
            const Divider(),
            SingleChildScrollView(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: interestModels.length,
                separatorBuilder: (_, __) => const Gap(8),
                itemBuilder: (BuildContext context, int index) {
                  return InterestTile(interestModel: interestModels[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
