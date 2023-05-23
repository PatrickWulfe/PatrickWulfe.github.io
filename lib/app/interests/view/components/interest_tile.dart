import 'package:auto_size_text/auto_size_text.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:url_launcher/url_launcher.dart';

class InterestTile extends StatelessWidget {
  const InterestTile({
    super.key,
    required this.interestModel,
  });

  final InterestModel interestModel;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 1200,
        maxHeight: 1000,
      ),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: appTheme.colorScheme.outline,
      //   ),
      //   borderRadius: BorderRadius.circular(16),
      // ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              AutoSizeText(
                interestModel.title,
                style: appTheme.textTheme.headlineMedium,
              ),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 80),
                  // child: FittedBox(
                  //   child: (interestModel.imageAssetName.endsWith('.svg'))
                  //       ? SvgPicture.asset(interestModel.imageAssetName)
                  //       : Image.asset(interestModel.imageAssetName),
                  // ),
                ),
              ),
            ],
          ),
          const Gap(8),
          AutoSizeText(interestModel.description),
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
