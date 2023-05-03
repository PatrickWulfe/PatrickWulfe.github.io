import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github/github.dart';
import 'package:portfolio_project/src/app/projects/data/repository/github_repository.dart';

part 'projects_bloc.freezed.dart';
part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc({
    required this.githubRepo,
  }) : super(const _ProjectsState()) {
    on<ProjectsEvent>((event, emit) async {
      await event.when(
        started: () async => _onStarted(event, emit),
        repoAdded: (repo) async => _onRepoAdded(event, emit, repo),
      );
    });
  }

  void _onStarted(ProjectsEvent event, Emitter<ProjectsState> emit) async {
    final repos = await githubRepo.getMyProjects();
    emit(
      state.copyWith(
        user: await githubRepo.getMyUserData(),
        repositories: await githubRepo.getMyProjects(),
      ),
    );
  }

  void _onRepoAdded(
    ProjectsEvent event,
    Emitter<ProjectsState> emit,
    Repository repo,
  ) async {
    emit(state.copyWith(repositories: [...state.repositories ?? [], repo]));
  }

  final GithubRepository githubRepo;
}
