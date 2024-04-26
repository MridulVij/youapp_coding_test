import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_coding_test/src/models/user_profile_data_model.dart';
import '../../../config/assets/api_assets.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/network/network_api_services.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
    on<SaveAndUpdateButtonClicked>(
      (event, emit) async {
        emit(AboutLoadingStateAfterClickingSaveAndEditButton());
        try {
          SharedPreferences sp = await SharedPreferences.getInstance();
          String? token = sp.getString('token');
          print('${event.displayName}');
          final response = await NetworkApiServices().putHeaderApi(header: {
            "x-access-token": token.toString()
          }, data: {
            'name': event.displayName,
            'birthday': event.birthday,
            'height': event.height,
            'weight': event.weight,
            'interests': ['jhg', 'jk', 'jm']
          }, url: ApiAssets.baseApi + '/api/updateProfile');
          print('Response is: $response');
          Map<String, dynamic> responseMap = response;
          print(responseMap['message']);
          if (responseMap['message'] ==
              "Profile has been updated successfully") {
            // UserProfileDataModel.fromJson(responseMap['message']);
            Data data = Data.fromJson(responseMap['data']);
            emit(AboutSuccessState(data));
          } else {
            emit(AboutFailureState());
          }
        } on SocketException {
          emit(AboutFailureState());
          throw InternetException('');
        } on RequestTimeOut {
          emit(AboutFailureState());
          throw RequestTimeOut("");
        }
      },
    );
    on<AboutEmptyEditButtonClicked>((event, emit) {
      emit(ShowCustomAboutFieldNotEmpty());
    });
  }
}
