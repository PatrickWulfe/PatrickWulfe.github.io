import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/github.dart' as gh;
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    late gh.GitHub github;
    // if (dotenv.isEveryDefined(['GH_USERNAME', 'GH_TOKEN'])) {
    // github = gh.GitHub(
    // auth: gh.Authentication.basic(
    //   dotenv.env['GH_USERNAME'],
    //   dotenv.env['GH_PASSWORD'],
    // ),
    // );
    // } else {
    github = gh.GitHub(auth: gh.Authentication.anonymous());
    // }
    return BlocProvider(
      create: (context) =>
          ProjectsBloc(githubRepo: GithubRepositoryImpl(github))
            ..add(const ProjectsEvent.started()),
      child: ScreenTypeLayout.builder(
        desktop: (context) => const DesktopProjectsView(),
        tablet: (context) => const TabletProjectsView(),
        mobile: (context) => const MobileProjectsView(),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      leading: const Icon(CommunityMaterialIcons.github),
      title: Text(title),
      subtitle: Text(
        subtitle ?? '',
        softWrap: true,
      ),
      onTap: onTap,
      tileColor: appTheme.colorScheme.surfaceVariant,
    );
  }
}

Future<void> pageLaunchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    // throw Exception('Could not launch $url');
  }
}
