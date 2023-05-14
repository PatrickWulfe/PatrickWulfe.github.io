import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.cardIcon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPress,
  });

  final IconData cardIcon;

  final String title;
  final String description;

  final String buttonText;

  final VoidCallback onButtonPress;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(
              cardIcon,
              size: 64,
            ),
            const SizedBox.square(dimension: 16),
            Text(
              title,
              style: appTheme.textTheme.titleMedium,
            ),
            const SizedBox.square(dimension: 32),
            Text(
              description,
              style: appTheme.textTheme.bodyLarge,
            ),
            const SizedBox.square(dimension: 16),
            Expanded(
              child: BottomRight(
                child: FilledButton(
                  onPressed: onButtonPress,
                  child: Text(buttonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
