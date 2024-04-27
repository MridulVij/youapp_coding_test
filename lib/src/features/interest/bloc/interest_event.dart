part of 'interest_bloc.dart';

class InterestEvent {}

final class InterestSaveButtonClicked extends InterestEvent {
  List<String>? interests;
  InterestSaveButtonClicked({required this.interests});
}
