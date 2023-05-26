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
I am a results-driven Software Engineer with expertise in Mobile Application Development, specializing in Flutter. Currently in the job market, I am actively seeking new opportunities to apply my skills and contribute to innovative projects.

Over the past two years, I have been instrumental in creating high-quality Flutter code for Evosus Inc. I played a key role in developing and maintaining two successful retail mobile applications: LOU Point of Sale, available on the PAX Store, and LOU Schedule, available on the Google Play Store and Apple App Store. In addition to honing my technical skills, this experience deepened my understanding of mobile application development, the development lifecycle, and mobile architecture. I also took on the responsibility of mentoring new developers, establishing documentation, styling, and linting standards for the mobile team.

I hold a Master's of Science in Computer Science from Portland State University, where my studies focused on Languages & Programming. Prior to that, I earned a Bachelor's Degree in Computer Science from Southern Oregon University in 2015, with a specialization in Programming and a minor in Emerging Media and Digital Arts. Throughout my academic journey, I excelled in multimedia projects, showcasing my ability to merge technology and creativity.

As a full-time music lover and part-time music producer, I have undertaken several notable projects. During my graduate program, I built the first granular synthesizer written in Rust, pushing the boundaries of sound synthesis. In addition, I led a team in developing a virtual software synthesizer instrument compatible with most Digital Audio Workstations as my capstone project. Furthermore, I developed a cutting-edge concert visualizer that dynamically responded to audio and MIDI data from a DJ's controller, eliminating the need for separate visual software and enhancing the overall performance and user experience.

From 2015 to 2017, I worked as a software programmer at iSOFT Systems, LLC. In this role, I specialized in modifying AccountMate, an accounting software based on Microsoft Visual FoxPro, to meet the unique requirements of various clients. I leveraged my skills in Visual FoxPro, SQL, and Crystal Reports to implement customizations and optimizations. Additionally, I developed Excel spreadsheets that streamlined data tracking and reporting, significantly improving efficiency and saving valuable time for the company.

I am enthusiastic about leveraging my skills, knowledge, and passion for software engineering to tackle new challenges and make a significant impact in the industry. If you are seeking a dedicated and adaptable Software Engineer with a track record of delivering exceptional results, I invite you to connect with me to explore potential collaboration.''';
