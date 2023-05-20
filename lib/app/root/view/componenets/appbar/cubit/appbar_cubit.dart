import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appbar_state.dart';
part 'appbar_cubit.freezed.dart';

class AppbarCubit extends Cubit<AppbarState> {
  AppbarCubit() : super(AppbarState.initial());
}
