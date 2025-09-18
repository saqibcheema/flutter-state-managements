import 'package:example_1/Model/users_state_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/users_cubit_class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Class Test'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<UsersCubitClass>().fetchUsers();
            },
            child: const Text('Load Users'),
          ),
          Expanded(
            child: StreamBuilder(
                stream: context.read<UsersCubitClass>().stream,
                builder: (context,snapshot){
                  final state = snapshot.data;

                  switch (state) {
                    case ProductInitial():
                      return Center(child: Text('Initial State'));
                    case ProductLoading():
                      return Center(child: CircularProgressIndicator());
                    case ProductLoaded():
                      return ListView.builder(
                          itemCount: state.user.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              title: Text(state.user[index].name),
                              subtitle: Text(state.user[index].jobTitle),
                            );
                          }
                      );
                    case ProductError():
                      return Center(child: Text(state.message));
                    default:
                      return Container();

                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}
