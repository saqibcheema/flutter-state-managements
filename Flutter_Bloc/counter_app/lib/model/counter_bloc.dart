import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_events.dart';
import 'counter_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(CounterStates()) {
    on<CounterIncrement>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
    on<CounterDecrement>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }
}
