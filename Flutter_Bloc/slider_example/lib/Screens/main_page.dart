import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_example/Bloc/slider_bloc.dart';
import 'package:slider_example/Bloc/slider_events.dart';
import 'package:slider_example/Bloc/slider_states.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('main rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Example'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Enable Notifications'),
              BlocBuilder<SliderBloc,SliderStates>(
                buildWhen: (previous,current) => previous.isEnable != current.isEnable,
                builder:(context,states){
                  print('Slider Switch');
                  return Switch(
                      value: states.isEnable,
                      onChanged: (_){
                        context.read<SliderBloc>().add(DisableAndEnableNotifications());
                      }
                  );
                },
              )
            ],
          ),
          BlocBuilder<SliderBloc,SliderStates>(
            buildWhen: (previous,current) => previous.value != current.value,
            builder: (context,states){
              return Container(
                height: 200,
                width: 200,
                color: Colors.teal.withOpacity(states.value),
              );
            },
          ),
          BlocBuilder<SliderBloc,SliderStates>(
            buildWhen: (previous,current) => previous.value != current.value,
            builder: (context,states){
              print('Slider Rebuild');
              return  Slider(
                  value: states.value,
                  onChanged: (value){
                    context.read<SliderBloc>().add(SliderValueChanged(value: value));
                  }
              );
          }
          )
        ],
      ),
    );
  }
}
