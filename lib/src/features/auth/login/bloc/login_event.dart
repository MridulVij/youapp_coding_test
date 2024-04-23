class LoginEvent {}

class LoginInitialEvent extends LoginEvent {
  final String username;
  final String email;
  final String password;
  LoginInitialEvent(
      {required this.username, required this.email, required this.password});
}
