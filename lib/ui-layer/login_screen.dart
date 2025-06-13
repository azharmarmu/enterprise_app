import 'package:enterprise_app/logic-layer/login/login_bloc.dart';
import 'package:enterprise_app/logic-layer/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic-layer/login/login_event.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final _loginBloc = LoginBloc();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Login Screen'),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (String? value) {},
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  // Call the login logic
                  //Input
                  final String email = emailController.text;
                  final String password = passwordController.text;
                  _loginBloc.add(
                    LoginWithCredentialsEvent(
                      email: email,
                      password: password,
                    ),
                  );

                  // response = LogicBloc().login(
                  //   emailController.text,
                  //   passwordController.text,
                  // );
                  //TODO: Bloc call
                },
                child: const Text('Login now'),
              ),
              const SizedBox(height: 64),
              BlocBuilder<LoginBloc, LoginState>(
                bloc: _loginBloc,
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is LoginSuccessState) {
                    return Text(
                      state.successMessage,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
