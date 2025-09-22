import 'package:equatable/equatable.dart';

class SliderStates extends Equatable {
  final double value;
  final bool isEnable;
  const SliderStates({this.value = 0.4,this.isEnable = true});

  SliderStates copyWith({double? value,bool? isEnable}) {
    return SliderStates(
        value: value ?? this.value,
        isEnable: isEnable ?? this.isEnable
    );
  }

  @override
  List<Object?> get props => [value,isEnable];
}
