part of 'projects_bloc.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
    User? user,
    List<Repository>? repositories,
    @Default(RepoSort.lastModified) RepoSort sort,
  }) = _ProjectsState;
}
