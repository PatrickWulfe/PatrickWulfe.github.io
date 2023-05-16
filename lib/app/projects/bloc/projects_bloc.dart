import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github/github.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio_project/app/app_index.dart';

part 'projects_bloc.freezed.dart';
part 'projects_event.dart';
part 'projects_state.dart';

@Injectable()
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc({
    required this.githubRepo,
  }) : super(const _ProjectsState()) {
    on<ProjectsEvent>((event, emit) async {
      await event.when(
        started: () async => _onStarted(event, emit),
        repoAdded: (repo) async => _onRepoAdded(event, emit, repo),
        sortChanged: (sort) async => _onSortChanged(event, emit, sort),
      );
    });
  }

  Future<void> _onStarted(
    ProjectsEvent event,
    Emitter<ProjectsState> emit,
  ) async {
    final userData = await githubRepo.getMyUserData();
    final repos = await githubRepo.getMyProjects();
    emit(
      ProjectsState(
        user: userData,
        repositories: repos,
        // repositories: [],
      ),
    );
    add(ProjectsEvent.sortChanged(sort: state.sort));
  }

  Future<void> _onRepoAdded(
    ProjectsEvent event,
    Emitter<ProjectsState> emit,
    Repository repo,
  ) async {
    emit(state.copyWith(repositories: [...state.repositories ?? [], repo]));
  }

  Future<void> _onSortChanged(
    ProjectsEvent event,
    Emitter<ProjectsState> emit,
    RepoSort sort,
  ) async {
    var repos = state.repositories;
    switch (sort) {
      case RepoSort.lastModified:
        if (repos != null) {
          repos = List.from(repos)
            ..sort((a, b) => b.updatedAt?.compareTo(a.updatedAt!) ?? 0);
        }
        break;
      case RepoSort.name:
        if (repos != null) {
          repos = List.from(repos)
            ..sort(
              (a, b) => a.name.toUpperCase().compareTo(b.name.toUpperCase()),
            );
        }
    }
    emit(state.copyWith(sort: sort, repositories: repos));
  }

  final GithubRepository githubRepo;
}
