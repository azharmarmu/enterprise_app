// class LogicBloc {
//   // Logic for login
//   String login(String email, String password) {
//     final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

//     //validate email and password
//     if (email.isEmpty) {
//       return 'Email cannot be empty';
//     } else if (!emailRegex.hasMatch(email)) {
//       return 'Not a valid email';
//     } else if (password.isEmpty) {
//       return 'Password cannot be empty';
//     } else if (password.length < 4) {
//       return 'Password at least 4 characters';
//     }

//     //Data-Layer
//     return 'Login successful';
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_helper.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginWithCredentialsEvent>(_onLoginWithCredentials);
    on<LoginWithFaceBook>(_onLoginWithFacebook);
  }

  final LoginHelper _loginHelper = LoginHelper();

  Future<void> _onLoginWithCredentials(
    LoginWithCredentialsEvent event,
    Emitter<LoginState> emit,
  ) async {
    //Loading state
    emit(LoginLoadingState());

    //Logics
    await Future.delayed(const Duration(
      seconds: 2,
    )); // Simulating network delay
    String msg = _loginHelper.login(
      event.email,
      event.password,
    );

    //Success or Error state
    emit(LoginSuccessState(successMessage: msg));
  }

  void _onLoginWithFacebook(LoginWithFaceBook event, Emitter<LoginState> emit) {
    //logics
  }
}
