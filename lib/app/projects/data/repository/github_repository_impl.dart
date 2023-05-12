import 'package:github/github.dart' as gh;
import 'package:injectable/injectable.dart';
import 'package:portfolio_project/app/app_index.dart';

@Singleton(as: GithubRepository)
class GithubRepositoryImpl implements GithubRepository {
  @factoryMethod
  GithubRepositoryImpl();

  final gh.GitHub gitHub = gh.GitHub();

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
  lastModified,
  name,
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
