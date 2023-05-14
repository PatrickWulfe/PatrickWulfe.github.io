import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class TabletInterestsView extends StatelessWidget {
  const TabletInterestsView({
    super.key,
    required this.interestModels,
  });

  final List<InterestModel> interestModels;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(tabletScreenPadding),
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: interestModels.length,
              itemBuilder: (BuildContext context, int index) {
                return InterestTile(interestModel: interestModels[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
