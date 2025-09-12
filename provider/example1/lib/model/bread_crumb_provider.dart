import 'package:flutter/cupertino.dart';
import 'breadcrumb_model.dart';

class BreadCrumbProvider extends ChangeNotifier{
  final List<BreadCrumb> _breadCrumbs = [];
  List<BreadCrumb> get breadCrumbs => _breadCrumbs;

  void add(BreadCrumb breadCrumb){
    for (var crumb in _breadCrumbs) {
      crumb.isActive = true;
    }
    _breadCrumbs.add(breadCrumb);
    notifyListeners();
  }

  void reset(){
    _breadCrumbs.clear();
    notifyListeners();
  }
}