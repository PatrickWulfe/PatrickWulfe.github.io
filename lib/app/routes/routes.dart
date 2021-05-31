import 'package:flutter/material.dart';
import 'package:portfolio_webapp/education/education.dart';
import 'package:portfolio_webapp/experience/experience.dart';
import 'package:portfolio_webapp/home/home.dart';
import 'package:portfolio_webapp/projects/projects.dart';

List<Page> onGenerateAppViewPages(String page, List<Page<dynamic>> pages) {
  switch (page) {
    case '/education':
      return [HomePage.page(), EducationPage.page()];
    case '/experience':
      return [HomePage.page(), ExperiencePage.page()];
    case '/projects':
      return [HomePage.page(), ProjectsPage.page()];
    default:
      return [HomePage.page()];
  }
}
