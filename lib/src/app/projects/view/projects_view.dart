import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:github/github.dart' as gh;
import 'package:portfolio_project/src/app/app_index.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authenticated = false;
    final dotenv = DotEnv()..load();
    late gh.GitHub github;
    if (dotenv.isEveryDefined(['ghUserName', 'ghPassword'])) {
      github = gh.GitHub(
        auth: gh.Authentication.basic(
            dotenv.env['ghUserName'], dotenv.env['ghPassword']),
      );
      authenticated = true;
    } else {
      github = gh.GitHub(auth: gh.Authentication.anonymous());
    }
    return BlocProvider(
      create: (context) =>
          ProjectsBloc(githubRepo: GithubRepositoryImpl(github))
            ..add(const ProjectsEvent.started()),
      child: ProjectsView(
        auth: authenticated,
      ),
    );
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    super.key,
    required this.auth,
  });

  final bool auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: BlocBuilder<ProjectsBloc, ProjectsState>(
        builder: (context, state) {
          if (state.user == null || (state.repositories ?? []).isEmpty) {
            return Center(
              child: Text(auth.toString()),
            );
          }
          return Column(
            children: [
              Text(auth.toString()),
              ListView.builder(
                itemCount: (state.repositories ?? []).length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(state.repositories![index].toString()),
                  );
                },
              ),
            ],
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
