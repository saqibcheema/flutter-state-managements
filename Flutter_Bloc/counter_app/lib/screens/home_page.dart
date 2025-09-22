import 'package:example1/model/counter_bloc.dart';
import 'package:example1/model/counter_events.dart';
import 'package:example1/model/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterStates>(
            builder: (context,state){
              return Text(state.counter.toString());
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(CounterIncrement());
                  },
                  child: const Text('Increment')
              ),
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(CounterDecrement());
                  },
                  child: const Text('Decrement')
              )
            ],
          )
        ],
      )
    );
  }
}
