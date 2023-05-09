import 'package:github/github.dart' as gh;
import 'package:portfolio_project/src/app/app_index.dart';

class GithubRepositoryImpl implements GithubRepository {
  GithubRepositoryImpl(this.gitHub);

  final gh.GitHub gitHub;

  @override
  Future<gh.User> getMyUserData() async {
    return gitHub.users.getUser('PatrickWulfe');
  }

  @override
  Future<List<gh.Repository>> getMyProjects() async {
    return gitHub.repositories.listUserRepositories('PatrickWulfe').toList();
  }
}

enum RepoSort {
  name,
  lastModified,
}

extension RepoSortName on RepoSort {
  String get name {
    switch (this) {
      case RepoSort.lastModified:
        return 'Last Modified';
      case RepoSort.name:
        return 'Name';
    }
  }
}
