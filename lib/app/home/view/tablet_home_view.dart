import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class TabletHomeView extends StatelessWidget {
  const TabletHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PageContainer.tablet(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AvatarImage(
                width: 400,
              ),
              AnimatedLogo(
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
