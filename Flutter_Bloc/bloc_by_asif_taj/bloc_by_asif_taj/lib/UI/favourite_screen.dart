import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_events.dart';
import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteItemScreen extends StatelessWidget {
  const FavouriteItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Items'),
      ),
      body: BlocBuilder<FavouriteBloc,FavouriteItemStates>(
          builder: (context,state){
            if(state is FavouriteItemLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is FavouriteItemLoaded){
              if(state.favouriteItems.isNotEmpty){
                return ListView.builder(
                    itemBuilder: (context,index){
                      
                    }
                )
              }
            }
          }
      )
    );
  }
}
