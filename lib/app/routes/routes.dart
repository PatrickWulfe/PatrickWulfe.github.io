import 'package:flutter/material.dart';
import 'package:portfolio_webapp/app/app.dart';
import 'package:portfolio_webapp/education/education.dart';
import 'package:portfolio_webapp/experience/experience.dart';
import 'package:portfolio_webapp/home/home.dart';
import 'package:portfolio_webapp/projects/projects.dart';

List<Page> onGenerateAppViewPages(String page, List<Page<dynamic>> pages) {
  switch (page) {
    case '/education':
      return [EducationPage.page()];
    case '/experience':
      return [ExperiencePage.page()];
    case '/projects':
      return [ProjectsPage.page()];
    default:
      return [HomePage.page()];
  }
}
