part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial({
    required ThemeCubit themeCubit,
  }) = _Initial;
}
