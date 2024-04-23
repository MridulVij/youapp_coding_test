import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/network/base_api_services.dart';
import '../../../../core/network/network_api_services.dart';
import 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginInitialEvent>((event, emit) {
      // NetworkApiServices().postApi();
    });
  }
}
