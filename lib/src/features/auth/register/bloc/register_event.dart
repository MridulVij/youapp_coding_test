part of 'register_bloc.dart';

class RegisterEvent {}

class RegisterButtonClickedEvent extends RegisterEvent {
  final String email;
  final String username;
  final String password;
  RegisterButtonClickedEvent(
      {required this.email, required this.username, required this.password});
}
