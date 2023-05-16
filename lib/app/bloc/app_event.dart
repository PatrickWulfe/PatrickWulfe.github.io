part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.started() = _Started;
  const factory AppEvent.themeChanged({
    required ThemeName themeName,
  }) = _ThemeChanged;
  const factory AppEvent.pageChanged({
    required int pageIndex,
  }) = _PageChanged;
  const factory AppEvent.themeSwapped() = _ThemeSwapped;
}
