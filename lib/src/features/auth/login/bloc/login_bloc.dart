import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:youapp_coding_test/src/core/responses/status.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/network/network_api_services.dart';
import '../../../../core/responses/api_response.dart';
import 'login_event.dart';
part 'login_state.dart';

const String baseApi = 'https://techtest.youapp.ai';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        NetworkApiServices().postApi({
          'email': event.email,
          'username': event.username,
          'password': event.password
        }, baseApi + '/api/login').then((value) {
          if (value['statusCode'] == 200) {
            emit(LoginSuccessState());
          }
          if (value['statusCode' == 400]) {
            emit(LoginFailureState());
          }
        });
      } on SocketException {
        emit(LoginFailureState());
        throw InternetException('');
      } on RequestTimeOut {
        emit(LoginFailureState());
        throw RequestTimeOut("");
      }
    });
    // Future<void> loginStateApi(LoginButtonPressedEvent event, Emitter emit) async{

    // }
  }
}
