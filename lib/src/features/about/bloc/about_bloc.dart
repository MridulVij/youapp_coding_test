import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_coding_test/src/models/user_profile_data_model.dart';

import '../../../config/assets/api_assets.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/network/network_api_services.dart';
import '../../auth/login/bloc/login_bloc.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
    on<SaveAndUpdateButtonClicked>((event, emit) async {
      // TODO: implement event handler
      emit(AboutLoadingStateAfterClickingSaveAndEditButton());
      try {
        SharedPreferences sp = await SharedPreferences.getInstance();
        String? token = sp.getString('token');

        final response = await NetworkApiServices().putHeaderApi(header: {
          "x-access-token": token.toString()
        }, data: {
          "name": event.displayName,
          "birthday": event.birthday,
          "height": event.height,
          "weight": event.weight,
          "interests": event.horoscope
        }, url: ApiAssets.baseApi + '/api/createProfile');
        print('Response is: $response');
        Map<String, dynamic> responseMap = response;
        print(responseMap['message']);
        if (responseMap['message'] == "Profile has been created") {
          UserProfileDataModel.fromJson(response);
          emit(AboutSuccessState());
        }
      } on SocketException {
        emit(AboutFailureState());
        throw InternetException('');
      } on RequestTimeOut {
        emit(AboutFailureState());
        throw RequestTimeOut("");
      }
    });
  }
}
