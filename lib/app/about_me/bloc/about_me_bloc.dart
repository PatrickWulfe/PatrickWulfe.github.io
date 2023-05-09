import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'about_me_event.dart';
part 'about_me_state.dart';

class AboutMeBloc extends Bloc<AboutMeEvent, AboutMeState> {
  AboutMeBloc() : super(AboutMeInitial()) {
    on<AboutMeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
