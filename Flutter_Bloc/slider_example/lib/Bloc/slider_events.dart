import 'package:equatable/equatable.dart';

class SliderEvents extends Equatable{
  const SliderEvents();

  @override
  List<Object> get props => [];
}

class DisableAndEnableNotifications extends SliderEvents{}

class SliderValueChanged extends SliderEvents{
  final double value;
  const SliderValueChanged({required this.value});

  @override
  List<Object> get props => [value];
}