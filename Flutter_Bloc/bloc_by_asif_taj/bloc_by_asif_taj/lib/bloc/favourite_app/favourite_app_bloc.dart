import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_events.dart';
import 'package:bloc_by_asif_taj/bloc/favourite_app/favourite_app_states.dart';

import '../../repository/favourite_app/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteItemStates> {
  final FavouriteRepository favouriteRepository;

  FavouriteBloc(this.favouriteRepository)
      : super(const FavouriteItemLoading()) {

    on<LoadFavouriteItemsEvent>((event, emit) async {
      emit(const FavouriteItemLoading());
      try{
        final favouriteItem = await favouriteRepository.fetchItem();
        emit(FavouriteItemLoaded(favouriteItems: favouriteItem));
      }catch(e){
        emit(FavouriteItemError(e.toString()));
      }
    });
  }
}
