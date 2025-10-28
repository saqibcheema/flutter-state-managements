
import 'package:bloc_by_asif_taj/model/favourite_item_model.dart';

class FavouriteRepository{

  final List<FavouriteItem> _items = [
    FavouriteItem(id: '1', value: 'Item 1',isDeleting: true),
    FavouriteItem(id: '2', value: 'Item 2'),
    FavouriteItem(id: '3', value: 'Item 3'),
    FavouriteItem(id: '4', value: 'Item 4'),
    FavouriteItem(id: '5', value: 'Item 5'),
    FavouriteItem(id: '6', value: 'Item 6'),
    FavouriteItem(id: '7', value: 'Item 7'),
    FavouriteItem(id: '8', value: 'Item 8'),
    FavouriteItem(id: '9', value: 'Item 9'),
    FavouriteItem(id: '10', value: 'Item 10'),
    FavouriteItem(id: '11', value: 'Item 11'),
    FavouriteItem(id: '12', value: 'Item 12'),
    FavouriteItem(id: '13', value: 'Item 13'),
    FavouriteItem(id: '14', value: 'Item 14'),
    FavouriteItem(id: '15', value: 'Item 15'),
    FavouriteItem(id: '16', value: 'Item 16'),
    FavouriteItem(id: '17', value: 'Item 17'),
    FavouriteItem(id: '18', value: 'Item 18'),
    FavouriteItem(id: '19', value: 'Item 19'),
    FavouriteItem(id: '20', value: 'Item 20'),
  ];

  Future<List<FavouriteItem>> fetchItem() async{
    return _items;
  }

  Future<void> deletedSelectedItems()async{
    _items.removeWhere((item) => item.isDeleting == true);
  }

  Future<void> updateList(List<FavouriteItem> updatedList)async{
    _items..clear()..addAll(updatedList);
  }
  
}