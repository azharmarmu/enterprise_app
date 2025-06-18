import 'package:enterprise_app/ui-layer/counter_page.dart';
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
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterApp(),
    );
  }
}
