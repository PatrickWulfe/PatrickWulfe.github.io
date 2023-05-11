import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class _InfoSection extends StatelessWidget {
  const _InfoSection({
    super.key,
    required this.info,
    required this.buttonText,
    required this.url,
  });

  final Widget info;
  final String buttonText;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        info,
        TextButton(
          onPressed: () {
            pageLaunchUrl(Uri.parse(url ?? ''));
          },
          child: Text(buttonText),
        ),
      ],
    );
  }
}
