import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InterestsPage extends StatelessWidget {
  const InterestsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final interestModels = [
      mtgInterestModel,
      musicInterestModel,
    ];
    return BlocProvider(
      create: (context) => InterestsBloc(),
      child: ScreenTypeLayout.builder(
        desktop: (context) => DesktopInterestsView(
          interestModels: interestModels,
        ),
        tablet: (context) => TabletInterestsView(
          interestModels: interestModels,
        ),
        mobile: (context) => MobileInterestsView(
          interestModels: interestModels,
        ),
      ),
    );
  }
}

const mtgInterestModel = InterestModel(
  title: 'Magic: The Gathering',
  imageAssetName: 'assets/images/mtg-logo.png',
  description: '''
I've been playing MTG off and on for the better part of 20 years now.  I started in middle school playing your typical "kitchen-table" Magic with my friends.
In college I started playing a bit more seriously once I learned there were actual competitive formats.
These days I pretty much only play commander (Big fan of Dimir if you can't tell by my decklists).
Feel free to check out my decks from the link below.''',
  linkUrl: 'https://www.moxfield.com/users/PatrickWulfe',
  buttonText: 'My Decks',
);

const musicInterestModel = InterestModel(
  title: 'Music Production',
  imageAssetName: 'assets/images/soundcloud-logo.svg',
  description: '''
I started producing electronic music in high school and have dabbled in it ever since.
I have goten to open shows for a lot of my favorite artists: Ill.Gates, Buku, Messinian, Getter, etc. for shows of upwards of 2000 people.
''',
  linkUrl: 'https://soundcloud.com/patrickwulfe',
  buttonText: 'My Soundcloud',
);
