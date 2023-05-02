import 'package:github/github.dart';

class GithubRepositoryImpl {
  GithubRepositoryImpl(this.gitHub);

  final GitHub gitHub;

  void getMyProjects() async {
    final me = await gitHub.users.getUser('PatrickWulfe');
    // me.
  }
}
