part of 'projects_bloc.dart';

@freezed
class ProjectsEvent with _$ProjectsEvent {
  const factory ProjectsEvent.started() = _Started;
  const factory ProjectsEvent.repoAdded({required Repository repo}) =
      _RepoAdded;
  const factory ProjectsEvent.sortChanged({required RepoSort sort}) =
      _SortChanged;
}
