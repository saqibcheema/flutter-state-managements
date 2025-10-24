
import 'package:bloc_by_asif_taj/model/favourite_item_model.dart';

class FavouriteRepository{

  Future<List<FavouriteItem>> fetchItem() async{
    return _generateList(10);
  }

  List<FavouriteItem> _generateList(int length){
    return List.generate(length, (index) => FavouriteItem(id: index.toString(), value: 'Item $index'));
  }
}