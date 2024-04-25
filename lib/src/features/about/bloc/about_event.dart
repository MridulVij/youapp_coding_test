part of 'about_bloc.dart';

class AboutEvent {}

class SaveAndUpdateButtonClicked extends AboutEvent {
  final String? displayName;
  final String? gender;
  final String? birthday;
  final String? horoscope;
  final String? zodiac;
  final int? height;
  final int? weight;

  SaveAndUpdateButtonClicked(
      {this.displayName,
      this.gender,
      this.birthday,
      this.horoscope,
      this.zodiac,
      this.height,
      this.weight});
}

class AboutEmptyEditButtonClicked extends AboutEvent {
  //
}
