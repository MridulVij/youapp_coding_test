import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/assets/api_assets.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/network/network_api_services.dart';
import '../../../models/user_profile_data_model.dart';
import '../../about/bloc/about_bloc.dart';

part 'interest_event.dart';
part 'interest_state.dart';

class InterestBloc extends Bloc<InterestEvent, InterestState> {
  InterestBloc() : super(InterestInitial()) {
    on<InterestSaveButtonClicked>((event, emit) async {
      // TODO: implement event handler
      emit(InterestLoadingState());
      try {
        SharedPreferences sp = await SharedPreferences.getInstance();
        String? token = sp.getString('token');

        // print('${}');
        final response = await NetworkApiServices().putHeaderApi(header: {
          "x-access-token": token.toString()
        }, data: {
          'name': '',
          'birthday': '',
          'height': 0,
          'weight': 0,
          'interests': event.interests
        }, url: ApiAssets.baseApi + '/api/updateProfile');
        print('Response is: $response');
        Map<String, dynamic> responseMap = response;
        print(responseMap['message']);
        if (responseMap['message'] == "Profile has been updated successfully") {
          // UserProfileDataModel.fromJson(responseMap['message']);
          Data data = Data.fromJson(responseMap['data']);
          emit(InterestSuccessState(interests: data.interests));
        } else {
          emit(InterestFailureState());
        }
      } on SocketException {
        emit(InterestFailureState());
        throw InternetException('');
      } on RequestTimeOut {
        emit(InterestFailureState());
        throw RequestTimeOut("");
      }
    });
  }
}
