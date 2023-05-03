import 'package:github/github.dart' as gh;
import 'package:portfolio_project/src/app/projects/data/repository/github_repository.dart';

class GithubRepositoryImpl implements GithubRepository {
  GithubRepositoryImpl(this.gitHub);

  final gh.GitHub gitHub;

  @override
  Future<gh.User> getMyUserData() async {
    return gitHub.users.getUser('PatrickWulfe');
  }

  @override
  Future<List<gh.Repository>> getMyProjects() {
    return gitHub.repositories.listUserRepositories('PatrickWulfe').toList();
  }
}
