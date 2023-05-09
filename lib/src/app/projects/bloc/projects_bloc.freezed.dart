// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Repository repo) repoAdded,
    required TResult Function(RepoSort sort) sortChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Repository repo)? repoAdded,
    TResult? Function(RepoSort sort)? sortChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Repository repo)? repoAdded,
    TResult Function(RepoSort sort)? sortChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RepoAdded value) repoAdded,
    required TResult Function(_SortChanged value) sortChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RepoAdded value)? repoAdded,
    TResult? Function(_SortChanged value)? sortChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RepoAdded value)? repoAdded,
    TResult Function(_SortChanged value)? sortChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsEventCopyWith<$Res> {
  factory $ProjectsEventCopyWith(
          ProjectsEvent value, $Res Function(ProjectsEvent) then) =
      _$ProjectsEventCopyWithImpl<$Res, ProjectsEvent>;
}

/// @nodoc
class _$ProjectsEventCopyWithImpl<$Res, $Val extends ProjectsEvent>
    implements $ProjectsEventCopyWith<$Res> {
  _$ProjectsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$ProjectsEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ProjectsEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Repository repo) repoAdded,
    required TResult Function(RepoSort sort) sortChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Repository repo)? repoAdded,
    TResult? Function(RepoSort sort)? sortChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Repository repo)? repoAdded,
    TResult Function(RepoSort sort)? sortChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RepoAdded value) repoAdded,
    required TResult Function(_SortChanged value) sortChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RepoAdded value)? repoAdded,
    TResult? Function(_SortChanged value)? sortChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RepoAdded value)? repoAdded,
    TResult Function(_SortChanged value)? sortChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProjectsEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_RepoAddedCopyWith<$Res> {
  factory _$$_RepoAddedCopyWith(
          _$_RepoAdded value, $Res Function(_$_RepoAdded) then) =
      __$$_RepoAddedCopyWithImpl<$Res>;
  @useResult
  $Res call({Repository repo});
}

/// @nodoc
class __$$_RepoAddedCopyWithImpl<$Res>
    extends _$ProjectsEventCopyWithImpl<$Res, _$_RepoAdded>
    implements _$$_RepoAddedCopyWith<$Res> {
  __$$_RepoAddedCopyWithImpl(
      _$_RepoAdded _value, $Res Function(_$_RepoAdded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repo = null,
  }) {
    return _then(_$_RepoAdded(
      repo: null == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as Repository,
    ));
  }
}

/// @nodoc

class _$_RepoAdded implements _RepoAdded {
  const _$_RepoAdded({required this.repo});

  @override
  final Repository repo;

  @override
  String toString() {
    return 'ProjectsEvent.repoAdded(repo: $repo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepoAdded &&
            (identical(other.repo, repo) || other.repo == repo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoAddedCopyWith<_$_RepoAdded> get copyWith =>
      __$$_RepoAddedCopyWithImpl<_$_RepoAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Repository repo) repoAdded,
    required TResult Function(RepoSort sort) sortChanged,
  }) {
    return repoAdded(repo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Repository repo)? repoAdded,
    TResult? Function(RepoSort sort)? sortChanged,
  }) {
    return repoAdded?.call(repo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Repository repo)? repoAdded,
    TResult Function(RepoSort sort)? sortChanged,
    required TResult orElse(),
  }) {
    if (repoAdded != null) {
      return repoAdded(repo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RepoAdded value) repoAdded,
    required TResult Function(_SortChanged value) sortChanged,
  }) {
    return repoAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RepoAdded value)? repoAdded,
    TResult? Function(_SortChanged value)? sortChanged,
  }) {
    return repoAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RepoAdded value)? repoAdded,
    TResult Function(_SortChanged value)? sortChanged,
    required TResult orElse(),
  }) {
    if (repoAdded != null) {
      return repoAdded(this);
    }
    return orElse();
  }
}

abstract class _RepoAdded implements ProjectsEvent {
  const factory _RepoAdded({required final Repository repo}) = _$_RepoAdded;

  Repository get repo;
  @JsonKey(ignore: true)
  _$$_RepoAddedCopyWith<_$_RepoAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SortChangedCopyWith<$Res> {
  factory _$$_SortChangedCopyWith(
          _$_SortChanged value, $Res Function(_$_SortChanged) then) =
      __$$_SortChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({RepoSort sort});
}

/// @nodoc
class __$$_SortChangedCopyWithImpl<$Res>
    extends _$ProjectsEventCopyWithImpl<$Res, _$_SortChanged>
    implements _$$_SortChangedCopyWith<$Res> {
  __$$_SortChangedCopyWithImpl(
      _$_SortChanged _value, $Res Function(_$_SortChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sort = null,
  }) {
    return _then(_$_SortChanged(
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as RepoSort,
    ));
  }
}

/// @nodoc

class _$_SortChanged implements _SortChanged {
  const _$_SortChanged({required this.sort});

  @override
  final RepoSort sort;

  @override
  String toString() {
    return 'ProjectsEvent.sortChanged(sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortChanged &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortChangedCopyWith<_$_SortChanged> get copyWith =>
      __$$_SortChangedCopyWithImpl<_$_SortChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Repository repo) repoAdded,
    required TResult Function(RepoSort sort) sortChanged,
  }) {
    return sortChanged(sort);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Repository repo)? repoAdded,
    TResult? Function(RepoSort sort)? sortChanged,
  }) {
    return sortChanged?.call(sort);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Repository repo)? repoAdded,
    TResult Function(RepoSort sort)? sortChanged,
    required TResult orElse(),
  }) {
    if (sortChanged != null) {
      return sortChanged(sort);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RepoAdded value) repoAdded,
    required TResult Function(_SortChanged value) sortChanged,
  }) {
    return sortChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RepoAdded value)? repoAdded,
    TResult? Function(_SortChanged value)? sortChanged,
  }) {
    return sortChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RepoAdded value)? repoAdded,
    TResult Function(_SortChanged value)? sortChanged,
    required TResult orElse(),
  }) {
    if (sortChanged != null) {
      return sortChanged(this);
    }
    return orElse();
  }
}

abstract class _SortChanged implements ProjectsEvent {
  const factory _SortChanged({required final RepoSort sort}) = _$_SortChanged;

  RepoSort get sort;
  @JsonKey(ignore: true)
  _$$_SortChangedCopyWith<_$_SortChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectsState {
  User? get user => throw _privateConstructorUsedError;
  List<Repository>? get repositories => throw _privateConstructorUsedError;
  RepoSort? get sort => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsStateCopyWith<ProjectsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateCopyWith(
          ProjectsState value, $Res Function(ProjectsState) then) =
      _$ProjectsStateCopyWithImpl<$Res, ProjectsState>;
  @useResult
  $Res call({User? user, List<Repository>? repositories, RepoSort? sort});
}

/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res, $Val extends ProjectsState>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? repositories = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      repositories: freezed == repositories
          ? _value.repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<Repository>?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as RepoSort?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectsStateCopyWith<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  factory _$$_ProjectsStateCopyWith(
          _$_ProjectsState value, $Res Function(_$_ProjectsState) then) =
      __$$_ProjectsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, List<Repository>? repositories, RepoSort? sort});
}

/// @nodoc
class __$$_ProjectsStateCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$_ProjectsState>
    implements _$$_ProjectsStateCopyWith<$Res> {
  __$$_ProjectsStateCopyWithImpl(
      _$_ProjectsState _value, $Res Function(_$_ProjectsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? repositories = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$_ProjectsState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      repositories: freezed == repositories
          ? _value._repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<Repository>?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as RepoSort?,
    ));
  }
}

/// @nodoc

class _$_ProjectsState implements _ProjectsState {
  const _$_ProjectsState(
      {this.user,
      final List<Repository>? repositories,
      this.sort = RepoSort.lastModified})
      : _repositories = repositories;

  @override
  final User? user;
  final List<Repository>? _repositories;
  @override
  List<Repository>? get repositories {
    final value = _repositories;
    if (value == null) return null;
    if (_repositories is EqualUnmodifiableListView) return _repositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final RepoSort? sort;

  @override
  String toString() {
    return 'ProjectsState(user: $user, repositories: $repositories, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectsState &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._repositories, _repositories) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user,
      const DeepCollectionEquality().hash(_repositories), sort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectsStateCopyWith<_$_ProjectsState> get copyWith =>
      __$$_ProjectsStateCopyWithImpl<_$_ProjectsState>(this, _$identity);
}

abstract class _ProjectsState implements ProjectsState {
  const factory _ProjectsState(
      {final User? user,
      final List<Repository>? repositories,
      final RepoSort? sort}) = _$_ProjectsState;

  @override
  User? get user;
  @override
  List<Repository>? get repositories;
  @override
  RepoSort? get sort;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectsStateCopyWith<_$_ProjectsState> get copyWith =>
      throw _privateConstructorUsedError;
}
