import 'package:flutter/material.dart';

void main() {
  String firstName = "joHn"; //John

  print(firstName.length); // Output: 4
  firstName.toUpperCase(); // Output: JOHN

  //Traditional way to capitalize first character
  toFirstCharUpper(firstName); // Output: John

  //Using extension method to capitalize first character
  firstName.toFirstCharUpperExt(); // Output: John

  //welcome(toFirstCharUpper(firstName));

  //Anonymous
  welcome(name: () {
    return toFirstCharUpper(firstName);
  });

  welcome(name: name);
}

String name() {
  return toFirstCharUpper('alex');
}

String toFirstCharUpper(String value) {
  //john -> John
  String fc = value.substring(0, 1).toUpperCase(); //J
  String rest = value.substring(1).toLowerCase(); //ohn

  return fc + rest; //John
}

//Function Declaration
void welcome({required String Function() name}) {
  print('Hi $name');
}

//FirstName  subString(3)//stN
extension StringExtension on String {
  String toFirstCharUpperExt() {
    String fc = this.substring(0, 1).toUpperCase(); //J
    String rest = this.substring(1).toLowerCase(); //ohn

    return fc + rest;
  }
}
