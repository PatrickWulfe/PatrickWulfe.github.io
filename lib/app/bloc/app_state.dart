part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.normal({
    required ThemeName themeName,
    required int pageIndex,
  }) = _Normal;
}
