import 'package:equatable/equatable.dart';

class CounterEvents extends Equatable{
  const CounterEvents();

  @override
  List<Object?> get props => [];
}

class CounterIncrement extends CounterEvents{}
class CounterDecrement extends CounterEvents{}