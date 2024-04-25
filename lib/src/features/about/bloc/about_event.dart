part of 'about_bloc.dart';

class AboutEvent {}

class SaveAndUpdateButtonClicked extends AboutEvent {
  final String displayName;
  final String gender;
  final String birthday;
  final String horoscope;
  final String zodiac;
  final int height;
  final int weight;

  SaveAndUpdateButtonClicked(
      {required this.displayName,
      required this.gender,
      required this.birthday,
      required this.horoscope,
      required this.zodiac,
      required this.height,
      required this.weight});
}

class AboutEmptyEditButtonClicked extends AboutEvent {
  //
}
