import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:url_launcher/url_launcher.dart';

class InterestTitle extends StatelessWidget {
  const InterestTitle({
    super.key,
    required this.interestModel,
  });

  final InterestModel interestModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(interestModel.title),
          Text(interestModel.description),
          BottomRight(
            child: FilledButton(
              onPressed: () {
                _launchUrl(Uri.parse(interestModel.linkUrl));
              },
              child: Text(interestModel.buttonText),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      //
    }
  }
}
