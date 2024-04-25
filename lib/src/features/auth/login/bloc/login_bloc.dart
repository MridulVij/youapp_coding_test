import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_coding_test/src/core/responses/status.dart';
import '../../../../config/assets/api_assets.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/network/network_api_services.dart';
import '../../../../core/responses/api_response.dart';
import 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final response = await NetworkApiServices().postApi({
          'email': event.email,
          'username': event.username,
          'password': event.password
        }, ApiAssets.baseApi + '/api/login');
        print('Response is: $response');
        Map<String, dynamic> responseMap = response;
        SharedPreferences sp = await SharedPreferences.getInstance();
        print(responseMap['message']);
        if (responseMap['message'] == "User has been logged in successfully") {
          sp.setString('token', responseMap['access_token']);
          emit(LoginSuccessState());
        }
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
