import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_events.dart';
import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_states.dart';

import '../../model/favourite_item_model.dart';
import '../../repository/favourite_app/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteItemStates> {
  final FavouriteRepository favouriteRepository;

  FavouriteBloc(this.favouriteRepository)
      : super(const FavouriteItemLoading()) {

    on<LoadFavouriteItemsEvent>((event, emit)  {
      emit(const FavouriteItemLoading());
      try{
        final favouriteItem =  favouriteRepository.fetchItem();
        emit(FavouriteItemLoaded(favouriteItems: favouriteItem));
      }catch(e){
        emit(FavouriteItemError(e.toString()));
      }
    });

    on<AddToFavouriteEvent>((event,emit)async{
      if(state is FavouriteItemLoaded){
        final currentState = state as FavouriteItemLoaded;
        final updatedList = currentState.favouriteItems.map((item){
          if(item.id == event.favouriteItem.id){
            return FavouriteItem(
                id: item.id,
                value:item.value,
                isFavourite: !item.isFavourite,
                isDeleting: item.isDeleting
            );
          }
          return item;
        }).toList();
        favouriteRepository.updateList(updatedList);
        emit(FavouriteItemLoaded(favouriteItems: updatedList));
      }});

    on<SelectItem>((event,emit)async{
      if(state is FavouriteItemLoaded){
        final currentState = state as FavouriteItemLoaded;
        final updatedList = currentState.favouriteItems.map((item){
          if(item.id == event.favouriteItem.id){
            return FavouriteItem(
                id: item.id,
                value:item.value,
                isFavourite: item.isFavourite,
                isDeleting: true
            );
          }
          return item;
        }).toList();
        favouriteRepository.updateList(updatedList);
        emit(FavouriteItemLoaded(favouriteItems: updatedList));
      }
    });

    on<UnSelectItem>((event,emit)async{
      if(state is FavouriteItemLoaded){
        final currentState = state as FavouriteItemLoaded;
        final updatedList = currentState.favouriteItems.map((item){
          if(item.id == event.favouriteItem.id){
            return FavouriteItem(
                id: item.id,
                value:item.value,
                isFavourite: item.isFavourite,
                isDeleting: false
            );
          }
          return item;
        }).toList();
        favouriteRepository.updateList(updatedList);
        emit(FavouriteItemLoaded(favouriteItems: updatedList));
      }
    });

    on<DeleteItemsEvent>((event,emit){
       favouriteRepository.deletedSelectedItems();
      final favouriteItem =  favouriteRepository.fetchItem();
      emit(FavouriteItemLoaded(favouriteItems: favouriteItem));
    });
  }
}