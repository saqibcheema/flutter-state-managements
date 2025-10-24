import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';

class FavouriteEvents extends Equatable{
  const FavouriteEvents();
  @override
  List<Object?> get props => [];
}

class LoadFavouriteItemsEvent extends FavouriteEvents{}

class AddToFavouriteEvent extends FavouriteEvents{
  final FavouriteItem favouriteItem;
  const AddToFavouriteEvent({required this.favouriteItem});
  @override
  List<Object?> get props => [favouriteItem];
}

