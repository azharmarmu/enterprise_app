import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic-layer/counter/bloc/counter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final obj = CounterBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter '),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Value'),
            const SizedBox(height: 16),
            BlocBuilder<CounterBloc, int>(
              bloc: obj,
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              obj.add(ResetEvent()); // Triggering the event
            },
            child: const Icon(
              Icons.restore_rounded,
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              obj.add(DecrementEvent(obj.state)); // Triggering the event
            },
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              obj.add(IncrementEvent(obj.state)); // Triggering the event
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
