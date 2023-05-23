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
Hello, and welcome to my portfolio website! I'm Patrick Wulfe, an experienced mobile app developer specializing in the Flutter framework, Dart, and various programming languages. With a Master's Degree in Computer Science and a focus on Programming and Languages, I bring a strong foundation and expertise to create exceptional and user-friendly mobile applications.

Throughout my career, I have demonstrated a knack for crafting high-quality software solutions that meet client needs and exceed expectations. I have a proven track record of delivering projects on time while ensuring attention to detail and a commitment to excellence.

My passion lies in designing intuitive interfaces that not only captivate users but also provide seamless experiences. I leverage my skills in Figma and other design tools to create visually appealing and user-centric mobile app interfaces that leave a lasting impression.

In my previous role at Evosus, I played a key role in building a robust design system for mobile applications, enabling efficient prototyping and maintaining consistency across products and platforms. Additionally, I established standards for documentation, code formatting, and architecture, contributing to a streamlined development process.

During my time at iSoft Systems, LLC, I customized AccountMate software for diverse clients, tailoring solutions to their specific needs. This experience honed my problem-solving skills and deepened my understanding of client-oriented development.

Beyond my technical expertise, I possess a strong grasp of agile methodologies and have actively participated in bi-weekly sprints, sprint planning meetings, and stand-ups. I believe in fostering collaborative environments that encourage teamwork, innovation, and open communication.

My broad skill set includes proficiency in Flutter, Dart, Figma, Git, Java, Python, JavaScript, C/C++/C#, HTML, CSS, Rust, Haskell, and various databases. As an enthusiastic learner, I am currently expanding my knowledge by exploring Golang.

If you're seeking a dedicated mobile app developer who can bring your ideas to life with creativity and precision, please take a moment to explore my portfolio. I would love to collaborate on your next exciting project and contribute to your team's success.''';
