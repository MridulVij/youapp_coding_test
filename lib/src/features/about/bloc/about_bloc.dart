import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
    on<EditAboutButtonClicked>((event, emit) {
      // TODO: implement event handler
    });
  }
}
