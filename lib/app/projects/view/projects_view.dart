import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/github.dart' as gh;
import 'package:portfolio_project/app/app_index.dart';
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
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: const [
                _ProfileHeader(),
                _ListSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ListSection extends StatelessWidget {
  const _ListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProjectsBloc>();
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        final appTheme = Theme.of(context);
        final dropdownItems = RepoSort.values
            .map<DropdownMenuItem<RepoSort>>(
              (e) => DropdownMenuItem<RepoSort>(value: e, child: Text(e.name)),
            )
            .toList();
        return Expanded(
            child: Material(
          color: appTheme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                color: appTheme.colorScheme.surface,
                constraints: const BoxConstraints(maxHeight: 48),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Text(
                      'Sort By: ',
                      style: appTheme.textTheme.labelMedium,
                    ),
                    DropdownButton<RepoSort>(
                      value: state.sort,
                      items: dropdownItems,
                      onChanged: (sort) {
                        bloc.add(ProjectsEvent.sortChanged(sort: sort!));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: (state.repositories ?? []).length,
                    separatorBuilder: (_, __) =>
                        const SizedBox.square(dimension: 2),
                    itemBuilder: (BuildContext context, int index) {
                      final element = state.repositories![index];
                      return ProjectTile(
                        title: element.name,
                        subtitle: element.description,
                        onTap: () => _launchUrl(
                            Uri.parse(state.repositories![index].htmlUrl)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: BlocBuilder<ProjectsBloc, ProjectsState>(
          builder: (context, state) {
            if (state.user != null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Name & Avatar
                  _AvatarSection(
                    avatarUrl: state.user!.avatarUrl!,
                    name: state.user!.name!,
                    userName: state.user!.login!,
                    location: state.user!.location!,
                    profileUrl: state.user!.htmlUrl!,
                    hirable: state.user!.hirable,
                    currentCompany: state.user!.company,
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class _AvatarSection extends StatelessWidget {
  const _AvatarSection({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.userName,
    required this.location,
    required this.profileUrl,
    required this.hirable,
    required this.currentCompany,
  }) : super(key: key);

  final String avatarUrl;
  final String name;
  final String userName;
  final String location;
  final String profileUrl;
  final bool? hirable;
  final String? currentCompany;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Row(
      children: [
        Image.network(avatarUrl),
        const SizedBox.square(dimension: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () => _launchUrl(Uri.parse(profileUrl)),
              child: Text(profileUrl),
            ),
            Text(
              name,
              style: appTheme.textTheme.displayMedium,
            ),
            Text(
              userName,
              style: appTheme.textTheme.titleLarge,
            ),
            if (hirable ?? true) const Text('Ready for work!'),
            if (!(hirable ?? true) && currentCompany != null)
              Text('Currently working at ${currentCompany ?? ''}'),
          ],
        ),
      ],
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({
    super.key,
    required this.info,
    required this.buttonText,
    required this.url,
  });

  final Widget info;
  final String buttonText;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        info,
        TextButton(
          onPressed: () {
            _launchUrl(Uri.parse(url ?? ''));
          },
          child: Text(buttonText),
        ),
      ],
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

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    // throw Exception('Could not launch $url');
  }
}
