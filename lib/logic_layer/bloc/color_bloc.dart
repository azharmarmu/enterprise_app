import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<StartStopColorEvent, ColorState> {
  ColorBloc() : super(const ColorState(Colors.red)) {
    // on<StartColorEvent>(_startColorLogic);
    // on<StopColorEvent>(_stopColorLogic);
    on<StartStopColorEvent>(_startStopColorLogic);
  }

  final colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  bool started = false; //Initial false

  // Future<void> _startColorLogic(event, emit) async {
  //   started = true;

  //   while (started) {
  //     Random random = Random();
  //     int randomIndex =
  //         random.nextInt(colors.length); // Generate a random index

  //     emit(ColorState(colors[randomIndex]));
  //     await Future.delayed(const Duration(seconds: 2)); //2
  //   }
  // }

  // void _stopColorLogic(StopColorEvent event, Emitter<ColorState> emit) {
  //   started = false;
  //   emit(const ColorState(Colors.red)); // Reset to initial color
  // }

  Future<void> _startStopColorLogic(event, emit) async {
    started = event.started;

    if (!started) {
      //emit(ColorState(colors[0])); // Reset to initial color if stopped
      emit(ColorState(state.color));
      return;
    }

    while (started) {
      Random random = Random();
      int randomIndex =
          random.nextInt(colors.length); // Generate a random index

      emit(ColorState(colors[randomIndex]));
      await Future.delayed(const Duration(seconds: 2)); //2
    }
  }
}
