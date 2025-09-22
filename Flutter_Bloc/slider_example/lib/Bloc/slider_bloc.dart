import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_example/Bloc/slider_events.dart';
import 'package:slider_example/Bloc/slider_states.dart';

class SliderBloc extends Bloc<SliderEvents, SliderStates>{
  SliderBloc() : super(const SliderStates()){
    on<SliderValueChanged>((event, emit) {
      emit(state.copyWith(value: event.value));
    });

    on<DisableAndEnableNotifications>((event,emit){
      emit(state.copyWith(isEnable: !state.isEnable));
    });
  }

}