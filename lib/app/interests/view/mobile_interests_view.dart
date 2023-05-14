import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class MobileInterestsView extends StatelessWidget {
  const MobileInterestsView({
    super.key,
    required this.interestModels,
  });

  final List<InterestModel> interestModels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: interestModels
          .map(
            (e) => InterestTile(
              interestModel: e,
            ),
          )
          .toList(),
    );
  }
}
