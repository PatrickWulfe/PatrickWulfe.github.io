// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final experienceModels = [
      ExperienceModel(
        companyName: 'Evosus',
        jobTitle: 'Mobile Application Developer',
        dateRange: "Aug '21 - Mar '23",
        description:
            'Worked as a software engineer creating cross-platform apps on the Flutter framework and was the lead designer for the mobile team using Figma.',
        bulletPoints: '''
• Employing Figma to develop a robust design system for mobile applications, ensuring aconsistent and professional look and feel across all products and platforms.
• Curating a collection of reusable components for mobile applications, allowing for rapid prototyping and increased consistency in design and functionality.
• Conducting quality control reviews of front-end code to ensure adherence to design specifications, resulting in high-quality, professional-looking mobile applications.
• Spearheading the development of standards for documentation, code formatting, and architecture, resulting in a more structured and efficient development process for mobile applications.
• Mentoring and coaching new team members on technical skills and professional development, fostering a collaborative and supportive team environment.
• Following clean architecture to build and write reusable, testable code. Using Dartz, Getit, Freezed, and Bloc for state management. Quickly understand high-level user stories and mocks from the product backlog and translate them into high-quality designs and code.
• Participate in code reviews Identify and correct bottlenecks and fix bugs. Continuously investigate third-party frameworks, APIs, and tools as needed to improve quality and development speed.
• Provide direction and support to the Delivery/Development teams to ensure adherence with the architectural direction, determine the implications of any deviations, and agree on any deviations as needed.
• Using simple agile methodologies, like weekly sprints and sprint planning meetings, stand-ups.
• Collaborate with a small team to plan projects and collaborate with cross-functional partners on all aspects of product development.
• Be an advocate for team-wide areas of improvement and best practices.
• Design and develop custom Flutter packages to re-use UI code and functional libraries.
• Participated in feature design and brainstorming for efficient feature delivery with highly optimized user experience.''',
      ),
      ExperienceModel(
        companyName: 'iSoft Systems, LLC',
        jobTitle: 'Software Developer',
        dateRange: '2015 - 2017',
        description:
            'Worked as a software developer customizing the AccountMate software for the companies various clients.  Mostly worked in Visual Fox Pro, Excel, and Crystal Reports.',
        bulletPoints: '''
• Customizing AccountMate software for over a dozen clients using Visual FoxPro, Crystal Reports, and Microsoft SQL Server on a per-client basis, resulting in efficient and effective solutions for each individual client.
• Creating an Excel spreadsheet for iSOFT Systems that automated the data import process into AccountMate, resulting in significant time savings for accounting and payroll functions.''',
      ),
    ];

    return ScreenTypeLayout.builder(
      desktop: (context) => DesktopExperienceView(
        experienceModels: experienceModels,
      ),
      tablet: (context) => TabletExperienceView(
        experienceModels: experienceModels,
      ),
      mobile: (context) => MobileExperienceView(
        experienceModels: experienceModels,
      ),
    );
  }
}
