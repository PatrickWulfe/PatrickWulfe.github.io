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
    required TResult Function(ScrollDirection scrollDirection) pageScroll,
    required TResult Function(int pageIndex) pageChanged,
    required TResult Function() themeSwapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function(ScrollDirection scrollDirection)? pageScroll,
    TResult? Function(int pageIndex)? pageChanged,
    TResult? Function()? themeSwapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function(ScrollDirection scrollDirection)? pageScroll,
    TResult Function(int pageIndex)? pageChanged,
    TResult Function()? themeSwapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ThemeChanged value) themeChanged,
    required TResult Function(_PageScroll value) pageScroll,
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_PageScroll value)? pageScroll,
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_PageScroll value)? pageScroll,
    TResult Function(_PageChanged value)? pageChanged,
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
    required TResult Function(ScrollDirection scrollDirection) pageScroll,
    required TResult Function(int pageIndex) pageChanged,
    required TResult Function() themeSwapped,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function(ScrollDirection scrollDirection)? pageScroll,
    TResult? Function(int pageIndex)? pageChanged,
    TResult? Function()? themeSwapped,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function(ScrollDirection scrollDirection)? pageScroll,
    TResult Function(int pageIndex)? pageChanged,
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
    required TResult Function(_PageScroll value) pageScroll,
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_PageScroll value)? pageScroll,
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_PageScroll value)? pageScroll,
    TResult Function(_PageChanged value)? pageChanged,
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
    required TResult Function(ScrollDirection scrollDirection) pageScroll,
    required TResult Function(int pageIndex) pageChanged,
    required TResult Function() themeSwapped,
  }) {
    return themeChanged(themeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function(ScrollDirection scrollDirection)? pageScroll,
    TResult? Function(int pageIndex)? pageChanged,
    TResult? Function()? themeSwapped,
  }) {
    return themeChanged?.call(themeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function(ScrollDirection scrollDirection)? pageScroll,
    TResult Function(int pageIndex)? pageChanged,
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
    required TResult Function(_PageScroll value) pageScroll,
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) {
    return themeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_PageScroll value)? pageScroll,
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) {
    return themeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_PageScroll value)? pageScroll,
    TResult Function(_PageChanged value)? pageChanged,
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
abstract class _$$_PageScrollCopyWith<$Res> {
  factory _$$_PageScrollCopyWith(
          _$_PageScroll value, $Res Function(_$_PageScroll) then) =
      __$$_PageScrollCopyWithImpl<$Res>;
  @useResult
  $Res call({ScrollDirection scrollDirection});
}

/// @nodoc
class __$$_PageScrollCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_PageScroll>
    implements _$$_PageScrollCopyWith<$Res> {
  __$$_PageScrollCopyWithImpl(
      _$_PageScroll _value, $Res Function(_$_PageScroll) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrollDirection = null,
  }) {
    return _then(_$_PageScroll(
      scrollDirection: null == scrollDirection
          ? _value.scrollDirection
          : scrollDirection // ignore: cast_nullable_to_non_nullable
              as ScrollDirection,
    ));
  }
}

/// @nodoc

class _$_PageScroll implements _PageScroll {
  const _$_PageScroll({required this.scrollDirection});

  @override
  final ScrollDirection scrollDirection;

  @override
  String toString() {
    return 'AppEvent.pageScroll(scrollDirection: $scrollDirection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageScroll &&
            (identical(other.scrollDirection, scrollDirection) ||
                other.scrollDirection == scrollDirection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scrollDirection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageScrollCopyWith<_$_PageScroll> get copyWith =>
      __$$_PageScrollCopyWithImpl<_$_PageScroll>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ThemeName themeName) themeChanged,
    required TResult Function(ScrollDirection scrollDirection) pageScroll,
    required TResult Function(int pageIndex) pageChanged,
    required TResult Function() themeSwapped,
  }) {
    return pageScroll(scrollDirection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function(ScrollDirection scrollDirection)? pageScroll,
    TResult? Function(int pageIndex)? pageChanged,
    TResult? Function()? themeSwapped,
  }) {
    return pageScroll?.call(scrollDirection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function(ScrollDirection scrollDirection)? pageScroll,
    TResult Function(int pageIndex)? pageChanged,
    TResult Function()? themeSwapped,
    required TResult orElse(),
  }) {
    if (pageScroll != null) {
      return pageScroll(scrollDirection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ThemeChanged value) themeChanged,
    required TResult Function(_PageScroll value) pageScroll,
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) {
    return pageScroll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_PageScroll value)? pageScroll,
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) {
    return pageScroll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_PageScroll value)? pageScroll,
    TResult Function(_PageChanged value)? pageChanged,
    TResult Function(_ThemeSwapped value)? themeSwapped,
    required TResult orElse(),
  }) {
    if (pageScroll != null) {
      return pageScroll(this);
    }
    return orElse();
  }
}

abstract class _PageScroll implements AppEvent {
  const factory _PageScroll({required final ScrollDirection scrollDirection}) =
      _$_PageScroll;

  ScrollDirection get scrollDirection;
  @JsonKey(ignore: true)
  _$$_PageScrollCopyWith<_$_PageScroll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PageChangedCopyWith<$Res> {
  factory _$$_PageChangedCopyWith(
          _$_PageChanged value, $Res Function(_$_PageChanged) then) =
      __$$_PageChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({int pageIndex});
}

/// @nodoc
class __$$_PageChangedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_PageChanged>
    implements _$$_PageChangedCopyWith<$Res> {
  __$$_PageChangedCopyWithImpl(
      _$_PageChanged _value, $Res Function(_$_PageChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
  }) {
    return _then(_$_PageChanged(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PageChanged implements _PageChanged {
  const _$_PageChanged({required this.pageIndex});

  @override
  final int pageIndex;

  @override
  String toString() {
    return 'AppEvent.pageChanged(pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageChanged &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageChangedCopyWith<_$_PageChanged> get copyWith =>
      __$$_PageChangedCopyWithImpl<_$_PageChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ThemeName themeName) themeChanged,
    required TResult Function(ScrollDirection scrollDirection) pageScroll,
    required TResult Function(int pageIndex) pageChanged,
    required TResult Function() themeSwapped,
  }) {
    return pageChanged(pageIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function(ScrollDirection scrollDirection)? pageScroll,
    TResult? Function(int pageIndex)? pageChanged,
    TResult? Function()? themeSwapped,
  }) {
    return pageChanged?.call(pageIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function(ScrollDirection scrollDirection)? pageScroll,
    TResult Function(int pageIndex)? pageChanged,
    TResult Function()? themeSwapped,
    required TResult orElse(),
  }) {
    if (pageChanged != null) {
      return pageChanged(pageIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ThemeChanged value) themeChanged,
    required TResult Function(_PageScroll value) pageScroll,
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) {
    return pageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_PageScroll value)? pageScroll,
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) {
    return pageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_PageScroll value)? pageScroll,
    TResult Function(_PageChanged value)? pageChanged,
    TResult Function(_ThemeSwapped value)? themeSwapped,
    required TResult orElse(),
  }) {
    if (pageChanged != null) {
      return pageChanged(this);
    }
    return orElse();
  }
}

abstract class _PageChanged implements AppEvent {
  const factory _PageChanged({required final int pageIndex}) = _$_PageChanged;

  int get pageIndex;
  @JsonKey(ignore: true)
  _$$_PageChangedCopyWith<_$_PageChanged> get copyWith =>
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
    required TResult Function(ScrollDirection scrollDirection) pageScroll,
    required TResult Function(int pageIndex) pageChanged,
    required TResult Function() themeSwapped,
  }) {
    return themeSwapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeName themeName)? themeChanged,
    TResult? Function(ScrollDirection scrollDirection)? pageScroll,
    TResult? Function(int pageIndex)? pageChanged,
    TResult? Function()? themeSwapped,
  }) {
    return themeSwapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeName themeName)? themeChanged,
    TResult Function(ScrollDirection scrollDirection)? pageScroll,
    TResult Function(int pageIndex)? pageChanged,
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
    required TResult Function(_PageScroll value) pageScroll,
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_ThemeSwapped value) themeSwapped,
  }) {
    return themeSwapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ThemeChanged value)? themeChanged,
    TResult? Function(_PageScroll value)? pageScroll,
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_ThemeSwapped value)? themeSwapped,
  }) {
    return themeSwapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ThemeChanged value)? themeChanged,
    TResult Function(_PageScroll value)? pageScroll,
    TResult Function(_PageChanged value)? pageChanged,
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
  int get pageIndex => throw _privateConstructorUsedError;
  bool get isScrollingDown => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ThemeName themeName, int pageIndex, bool isScrollingDown)
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeName themeName, int pageIndex, bool isScrollingDown)?
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeName themeName, int pageIndex, bool isScrollingDown)?
        normal,
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
  $Res call({ThemeName themeName, int pageIndex, bool isScrollingDown});
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
    Object? pageIndex = null,
    Object? isScrollingDown = null,
  }) {
    return _then(_value.copyWith(
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as ThemeName,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isScrollingDown: null == isScrollingDown
          ? _value.isScrollingDown
          : isScrollingDown // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NormalCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_NormalCopyWith(_$_Normal value, $Res Function(_$_Normal) then) =
      __$$_NormalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeName themeName, int pageIndex, bool isScrollingDown});
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
    Object? pageIndex = null,
    Object? isScrollingDown = null,
  }) {
    return _then(_$_Normal(
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as ThemeName,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isScrollingDown: null == isScrollingDown
          ? _value.isScrollingDown
          : isScrollingDown // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Normal implements _Normal {
  const _$_Normal(
      {required this.themeName,
      required this.pageIndex,
      required this.isScrollingDown});

  @override
  final ThemeName themeName;
  @override
  final int pageIndex;
  @override
  final bool isScrollingDown;

  @override
  String toString() {
    return 'AppState.normal(themeName: $themeName, pageIndex: $pageIndex, isScrollingDown: $isScrollingDown)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Normal &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName) &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.isScrollingDown, isScrollingDown) ||
                other.isScrollingDown == isScrollingDown));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, themeName, pageIndex, isScrollingDown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NormalCopyWith<_$_Normal> get copyWith =>
      __$$_NormalCopyWithImpl<_$_Normal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ThemeName themeName, int pageIndex, bool isScrollingDown)
        normal,
  }) {
    return normal(themeName, pageIndex, isScrollingDown);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeName themeName, int pageIndex, bool isScrollingDown)?
        normal,
  }) {
    return normal?.call(themeName, pageIndex, isScrollingDown);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeName themeName, int pageIndex, bool isScrollingDown)?
        normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(themeName, pageIndex, isScrollingDown);
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
  const factory _Normal(
      {required final ThemeName themeName,
      required final int pageIndex,
      required final bool isScrollingDown}) = _$_Normal;

  @override
  ThemeName get themeName;
  @override
  int get pageIndex;
  @override
  bool get isScrollingDown;
  @override
  @JsonKey(ignore: true)
  _$$_NormalCopyWith<_$_Normal> get copyWith =>
      throw _privateConstructorUsedError;
}
