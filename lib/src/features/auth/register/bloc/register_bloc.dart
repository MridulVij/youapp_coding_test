import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:youapp_coding_test/src/config/assets/api_assets.dart';
import 'package:youapp_coding_test/src/features/auth/login/bloc/login_bloc.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/network/network_api_services.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<RegisterButtonClickedEvent>((event, emit) async {
      // TODO: implement event handler

      emit(RegisterLoadingState());
      try {
        final response = await NetworkApiServices().postApi({
          'email': event.email,
          'username': event.username,
          'password': event.password
        }, ApiAssets.baseApi + '/api/login');
        print('Response is: $response');
        Map<String, dynamic> responseMap = response;
        print(responseMap['message']);
        if (responseMap['message'] == "User has been created successfully") {
          emit(RegisterSuccessState());
        }
      } on SocketException {
        emit(RegisterFailureState());
        throw InternetException('');
      } on RequestTimeOut {
        emit(RegisterFailureState());
        throw RequestTimeOut("");
      }
    });
  }
}
