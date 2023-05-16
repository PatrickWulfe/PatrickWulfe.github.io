import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'desktop_about_me_view.dart';
part 'mobile_about_me_view.dart';
part 'tablet_about_me_view.dart';

class AboutMePage extends HookWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutMeBloc(),
      child: ScreenTypeLayout.builder(
        desktop: (context) => const DesktopAboutMeView(aboutMe: aboutMe),
        tablet: (context) => const TabletAboutMeView(aboutMe: aboutMe),
        mobile: (context) => const MobileAboutMeView(aboutMe: aboutMe),
      ),
    );
  }
}

const aboutMe = '''
Highly skilled mobile app developer with expertise in the Flutter framework, Dart, and other programming
languages, with experience developing high-quality, user-friendly mobile applications. Proven ability to
design and implement software solutions to meet client needs, and consistently deliver projects on time.
Extensive experience using Figma and other design tools to create intuitive and visually appealing
interfaces. Holds a Master of Science in Computer Science with a focus on Programming and
Languages, as well as a Bachelor of Science in Computer Science. Ready to take on new challenges
and contribute to the success of a dynamic and innovative team.
''';

const _aboutMe = '''
I was born in a city of magic and technology, where wizards and engineers worked together to create wonders and innovations. I had a talent for both fields, and I dreamed of becoming a software developer, a person who could create programs and applications that ran on magical devices.

I studied hard and learned the basics of coding and magic, but I also had a rebellious streak and a thirst for adventure. I often hacked into the city’s network and explored the hidden corners of the digital world. I also joined a group of hackers who called themselves the Codebreakers, and who used their skills to expose corruption and injustice in the city.

One day, I received a mysterious message from an unknown sender, who claimed to have a secret that could change the world. I followed the instructions and met the sender in an abandoned warehouse, where I discovered a device that looked like a portal to another dimension. The sender told me that it was a prototype of a new technology that could connect the digital world with the physical world, and that he needed my help to test it.

I agreed, and stepped into the portal, not knowing what awaited me on the other side. I found myself in a land of fantasy and wonder, where dragons flew in the sky and elves lived in the forests. I also realized that I had a new power: I could manipulate the code of reality with my mind.

I decided to explore this new world and use my power for good, but I also faced dangers and enemies along the way. I became a software developer in a fantasy world, and my adventure had just begun.

--Written by ChatGPT as a placeholder.''';
