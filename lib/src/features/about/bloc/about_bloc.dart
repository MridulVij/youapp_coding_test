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

          final response = await NetworkApiServices().postHeaderApi(header: {
            "x-access-token": token.toString()
          }, data: {
            "name": event.displayName.toString(),
            "birthday": event.birthday.toString(),
            "height": event.height,
            "weight": event.weight,
            "interests": ['jhg', 'jk', 'jm']
          }, url: ApiAssets.baseApi + '/api/createProfile');
          print('Response is: $response');
          Map<String, dynamic> responseMap = response;
          print(responseMap['message']);
          if (responseMap['message'] ==
              "Profile has been created successfully") {
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
      },
    );
    on<AboutEmptyEditButtonClicked>((event, emit) {
      emit(ShowCustomAboutFieldNotEmpty());
    });
  }
}
