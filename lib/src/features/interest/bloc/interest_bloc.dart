import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'interest_event.dart';
part 'interest_state.dart';

class InterestBloc extends Bloc<InterestEvent, InterestState> {
  InterestBloc() : super(InterestInitial()) {
    on<InterestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
