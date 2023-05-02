// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ThemeName themeName) themeChanged,
    required TResult Function() themeSwapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function()? themeSwapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function()? themeSwapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ThemeChanged value) themeChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_ThemeSwapped value)? themeSwapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

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
    extends _$AppEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AppEvent.started()';
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
    required TResult Function(ThemeName themeName) themeChanged,
    required TResult Function() themeSwapped,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function()? themeSwapped,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function()? themeSwapped,
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
    required TResult Function(_ThemeChanged value) themeChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_ThemeSwapped value)? themeSwapped,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AppEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_ThemeChangedCopyWith<$Res> {
  factory _$$_ThemeChangedCopyWith(
          _$_ThemeChanged value, $Res Function(_$_ThemeChanged) then) =
      __$$_ThemeChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({ThemeName themeName});
}

/// @nodoc
class __$$_ThemeChangedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_ThemeChanged>
    implements _$$_ThemeChangedCopyWith<$Res> {
  __$$_ThemeChangedCopyWithImpl(
      _$_ThemeChanged _value, $Res Function(_$_ThemeChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeName = null,
  }) {
    return _then(_$_ThemeChanged(
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as ThemeName,
    ));
  }
}

/// @nodoc

class _$_ThemeChanged implements _ThemeChanged {
  const _$_ThemeChanged({required this.themeName});

  @override
  final ThemeName themeName;

  @override
  String toString() {
    return 'AppEvent.themeChanged(themeName: $themeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemeChanged &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThemeChangedCopyWith<_$_ThemeChanged> get copyWith =>
      __$$_ThemeChangedCopyWithImpl<_$_ThemeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ThemeName themeName) themeChanged,
    required TResult Function() themeSwapped,
  }) {
    return themeChanged(themeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function()? themeSwapped,
  }) {
    return themeChanged?.call(themeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function()? themeSwapped,
    required TResult orElse(),
  }) {
    if (themeChanged != null) {
      return themeChanged(themeName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ThemeChanged value) themeChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) {
    return themeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) {
    return themeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_ThemeSwapped value)? themeSwapped,
    required TResult orElse(),
  }) {
    if (themeChanged != null) {
      return themeChanged(this);
    }
    return orElse();
  }
}

abstract class _ThemeChanged implements AppEvent {
  const factory _ThemeChanged({required final ThemeName themeName}) =
      _$_ThemeChanged;

  ThemeName get themeName;
  @JsonKey(ignore: true)
  _$$_ThemeChangedCopyWith<_$_ThemeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ThemeSwappedCopyWith<$Res> {
  factory _$$_ThemeSwappedCopyWith(
          _$_ThemeSwapped value, $Res Function(_$_ThemeSwapped) then) =
      __$$_ThemeSwappedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ThemeSwappedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_ThemeSwapped>
    implements _$$_ThemeSwappedCopyWith<$Res> {
  __$$_ThemeSwappedCopyWithImpl(
      _$_ThemeSwapped _value, $Res Function(_$_ThemeSwapped) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ThemeSwapped implements _ThemeSwapped {
  const _$_ThemeSwapped();

  @override
  String toString() {
    return 'AppEvent.themeSwapped()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ThemeSwapped);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ThemeName themeName) themeChanged,
    required TResult Function() themeSwapped,
  }) {
    return themeSwapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function()? themeSwapped,
  }) {
    return themeSwapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function()? themeSwapped,
    required TResult orElse(),
  }) {
    if (themeSwapped != null) {
      return themeSwapped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ThemeChanged value) themeChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) {
    return themeSwapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) {
    return themeSwapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_ThemeSwapped value)? themeSwapped,
    required TResult orElse(),
  }) {
    if (themeSwapped != null) {
      return themeSwapped(this);
    }
    return orElse();
  }
}

abstract class _ThemeSwapped implements AppEvent {
  const factory _ThemeSwapped() = _$_ThemeSwapped;
}

/// @nodoc
mixin _$AppState {
  ThemeName get themeName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeName themeName) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeName themeName)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeName themeName)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Normal value) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Normal value)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Normal value)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({ThemeName themeName});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeName = null,
  }) {
    return _then(_value.copyWith(
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as ThemeName,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NormalCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_NormalCopyWith(_$_Normal value, $Res Function(_$_Normal) then) =
      __$$_NormalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeName themeName});
}

/// @nodoc
class __$$_NormalCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_Normal>
    implements _$$_NormalCopyWith<$Res> {
  __$$_NormalCopyWithImpl(_$_Normal _value, $Res Function(_$_Normal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeName = null,
  }) {
    return _then(_$_Normal(
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as ThemeName,
    ));
  }
}

/// @nodoc

class _$_Normal implements _Normal {
  const _$_Normal({required this.themeName});

  @override
  final ThemeName themeName;

  @override
  String toString() {
    return 'AppState.normal(themeName: $themeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Normal &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NormalCopyWith<_$_Normal> get copyWith =>
      __$$_NormalCopyWithImpl<_$_Normal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeName themeName) normal,
  }) {
    return normal(themeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeName themeName)? normal,
  }) {
    return normal?.call(themeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeName themeName)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(themeName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Normal value) normal,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Normal value)? normal,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Normal value)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }
}

abstract class _Normal implements AppState {
  const factory _Normal({required final ThemeName themeName}) = _$_Normal;

  @override
  ThemeName get themeName;
  @override
  @JsonKey(ignore: true)
  _$$_NormalCopyWith<_$_Normal> get copyWith =>
      throw _privateConstructorUsedError;
}
