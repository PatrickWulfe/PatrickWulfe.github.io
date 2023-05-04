import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/github.dart' as gh;
import 'package:portfolio_project/src/app/app_index.dart';
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
      child: const ProjectsView(),
    );
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: BlocBuilder<ProjectsBloc, ProjectsState>(
        builder: (context, state) {
          if (state.user == null || (state.repositories ?? []).isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: (state.repositories ?? []).length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              final element = state.repositories![index];
              return ProjectTile(
                title: element.name,
                subtitle: element.description,
                onTap: () =>
                    _launchUrl(Uri.parse(state.repositories![index].htmlUrl)),
              );
            },
          );
        },
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

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    // throw Exception('Could not launch $url');
  }
}
