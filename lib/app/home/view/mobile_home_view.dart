import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(mobileScreenPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AvatarImage(
                width: 300,
              ),
              AnimatedLogo(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
