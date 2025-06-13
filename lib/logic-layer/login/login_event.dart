abstract class LoginEvent {}

class LoginWithCredentialsEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialsEvent({
    required this.email,
    required this.password,
  });
}

class LoginWithFaceBook extends LoginEvent {}
