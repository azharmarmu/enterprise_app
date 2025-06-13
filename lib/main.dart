import 'package:enterprise_app/ui-layer/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //object creation
  runApp(const MyApp()); //function call
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

//runApp-> MaterialApp(Theming, Routing, Localization, etc) -> home: Scaffold(AppBar, Body, BottomNavigationBar, FloatingActionButton, etc) -> Widgets(StatelessWidget, StatefulWidget, InheritedWidget, etc)

