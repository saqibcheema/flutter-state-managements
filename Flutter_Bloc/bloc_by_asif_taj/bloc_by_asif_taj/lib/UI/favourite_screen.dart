import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_events.dart';
import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/favourite_item_model.dart';

class FavouriteItemScreen extends StatelessWidget {
  const FavouriteItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Items'),
        actions: [
          IconButton(
              onPressed: (){
                context.read<FavouriteBloc>().add(DeleteItemsEvent());
              },
              icon: Icon(Icons.delete,color: Colors.red,)
          )
        ],
      ),
      body: BlocBuilder<FavouriteBloc,FavouriteItemStates>(
          builder: (context,state){
            if(state is FavouriteItemLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is FavouriteItemLoaded){
              if(state.favouriteItems.isNotEmpty){
                return ListView.builder(
                  itemCount: state.favouriteItems.length,
                    itemBuilder: (context,index){
                    final item = state.favouriteItems[index];
                      return Card(
                        margin: const EdgeInsets.all(20),
                        elevation: 4,
                        child: ListTile(
                          title: Text(item.id),
                          subtitle: Text(item.value),
                          trailing: IconButton(
                              onPressed: (){
                                context.read<FavouriteBloc>().add(AddToFavouriteEvent(favouriteItem: FavouriteItem(id: item.id, value: item.value, isFavourite: !item.isFavourite)));
                              },
                              icon: item.isFavourite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                          ),
                          leading: Checkbox(
                              value: item.isDeleting,
                              onChanged: (value){
                                if(value=true){
                                  context.read<FavouriteBloc>().add(SelectItem(favouriteItem: item));
                                }else{
                                  context.read<FavouriteBloc>().add(UnSelectItem(favouriteItem: item));
                                }
                              }
                          ),
                        ),
                      );
                    }
                );
              }else {
                return const Center(
                  child: Text('No favourite items found'),
                );
              }
            }else if(state is FavouriteItemError){
              return Center(child: Text(state.error),);
            }else{
              return SizedBox.shrink();
            }
          }
      )
    );
  }
}
