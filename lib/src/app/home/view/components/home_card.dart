import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.cardIcon,
    required this.description,
    required this.buttonText,
    required this.onButtonPress,
  });

  final IconData cardIcon;

  final String description;

  final String buttonText;

  final VoidCallback onButtonPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(
              cardIcon,
              size: 48,
            ),
            const SizedBox.square(dimension: 16),
            Text(description),
            const SizedBox.square(dimension: 16),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
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
