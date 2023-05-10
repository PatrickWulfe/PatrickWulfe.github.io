import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RightPane extends StatelessWidget {
  const RightPane({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      children: [
        Expanded(child: Container()),
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            'wulfep@gmail.com',
            style: appTheme.textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 16),
        IconButton(
            onPressed: () {
              _launchUrl(Uri.parse('mailto:wulfep@gmail.com'));
            },
            icon: const Icon(Icons.email)),
        const SizedBox(height: 16),
        Expanded(
          child: Container(
            width: 1,
            color: appTheme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      //
    }
  }
}