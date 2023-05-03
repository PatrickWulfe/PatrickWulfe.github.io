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
          return ListView.builder(
            itemCount: (state.repositories ?? []).length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.repositories![index].name),
                // onTap: () =>
                //     _launchUrl(Uri.parse(state.repositories![index].htmlUrl)),
              );
            },
          );
          // return Center(
          //   child: Column(
          //     children: [
          //       const Text('Under Construction'),
          //       Image.asset('assets/images/nyan.gif'),
          //       Text(''),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
