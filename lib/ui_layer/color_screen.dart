import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic_layer/bloc/color_bloc.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _colorBloc = ColorBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Color Screen',
              style: TextStyle(fontSize: 24),
            ),
            BlocBuilder<ColorBloc, ColorState>(
              bloc: _colorBloc,
              builder: (context, state) {
                return ColoredBox(
                  color: state.color,
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<ColorBloc, ColorState>(
              bloc: _colorBloc,
              buildWhen: (previous, current) {
                return true;
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    _colorBloc.add(StartStopColorEvent(
                      !_colorBloc.started,
                    ));
                  },
                  child: Text(_colorBloc.started == false ? 'START' : 'STOP'),
                );
              },
            )

            // if (_colorBloc.started == false)
            //   ElevatedButton(
            //     onPressed: () {
            //       _colorBloc.add(StartColorEvent());
            //     },
            //     child: Text('START'),
            //   )
            // else
            //   ElevatedButton(
            //     onPressed: () {
            //       _colorBloc.add(StopColorEvent());
            //     },
            //     child: Text('STOP'),
            //   )
          ],
        ),
      ),
    );
  }
}
