class LoginEvent {}

class LoginButtonPressedEvent extends LoginEvent {
  final String? email;
  final String? password;
  final String? username;
  LoginButtonPressedEvent({this.email, this.password, this.username});
}
