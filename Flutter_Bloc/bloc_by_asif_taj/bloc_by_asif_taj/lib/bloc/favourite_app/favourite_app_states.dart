import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';

class FavouriteItemStates extends Equatable{
  const FavouriteItemStates();
  @override
  List<Object?> get props => [];
}

class FavouriteItemLoading extends FavouriteItemStates{
  const FavouriteItemLoading();
}
class FavouriteItemLoaded extends FavouriteItemStates{
  final List<FavouriteItem> favouriteItems;
  const FavouriteItemLoaded({this.favouriteItems = const []});

  FavouriteItemLoaded copyWith({List<FavouriteItem>? favouriteItems}){
    return FavouriteItemLoaded(favouriteItems: favouriteItems ?? this.favouriteItems);
  }
  @override
  List<Object?> get props => [favouriteItems];
}
class FavouriteItemError extends FavouriteItemStates{
  final String error;
  const FavouriteItemError(this.error);
  @override
  List<Object?> get props => [error];
}