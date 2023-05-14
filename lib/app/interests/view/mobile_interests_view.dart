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
    return Center(
      child: Material(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: interestModels.length,
          itemBuilder: (BuildContext context, int index) {
            return InterestTile(interestModel: interestModels[index]);
          },
        ),
      ),
    );
  }
}
