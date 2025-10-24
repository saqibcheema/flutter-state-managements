import 'package:bloc_by_asif_taj/repository/favourite_app/favourite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/favourite_screen.dart';
import 'bloc/favourite_app/favourite_app_bloc.dart';
import 'bloc/favourite_app/favourite_app_events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = FavouriteBloc(FavouriteRepository());
        bloc.add(LoadFavouriteItemsEvent());
        return bloc;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const FavouriteItemScreen(),
      ),
    );
  }
}