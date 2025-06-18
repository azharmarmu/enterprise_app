import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
    on<ResetEvent>(_onReset);
  }

  void _onIncrement(IncrementEvent event, Emitter<int> emit) {
    int res = event.value + 1; //logic
    

    emit(res);
  }

  void _onDecrement(DecrementEvent event, Emitter<int> emit) {
    int res = event.value - 1; //logic

    emit(res);
  }

  void _onReset(ResetEvent event, Emitter<int> emit) => emit(0);
}
