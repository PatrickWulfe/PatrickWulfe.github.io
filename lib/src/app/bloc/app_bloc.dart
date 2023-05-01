import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_project/src/app/utils/theme/cubit/theme_cubit.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(_Initial(themeCubit: ThemeCubit(useLightTheme: false))) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
