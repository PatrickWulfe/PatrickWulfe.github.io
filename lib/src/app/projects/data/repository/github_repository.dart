import 'package:github/github.dart' as gh;

abstract class GithubRepository {
  Future<gh.User> getMyUserData();
  Future<List<gh.Repository>> getMyProjects();
}
