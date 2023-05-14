import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftPane extends StatelessWidget {
  const LeftPane({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 1,
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://github.com/PatrickWulfe'));
                },
                icon: const Icon(CommunityMaterialIcons.github),
              ),
              const Gap(16),
              IconButton(
                onPressed: () {
                  _launchUrl(
                    Uri.parse('https://www.linkedin.com/in/patrick-wulfe/'),
                  );
                },
                icon: const Icon(CommunityMaterialIcons.linkedin),
              ),
            ],
          ),
          const Gap(16),
          Expanded(
            child: Container(
              width: 1,
              color: appTheme.colorScheme.onSurface,
            ),
          )
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
