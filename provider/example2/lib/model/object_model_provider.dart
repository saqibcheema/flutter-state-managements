import 'dart:async';
import 'package:example2/model/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ObjectModelProvider extends ChangeNotifier{
  late String id;
  late CheaperModel cheaperModel;
  late StreamSubscription cheaperModelSubscription;
  late ExpensiveModel expensiveModel;
  late StreamSubscription expensiveModelSubscription;

  ObjectModelProvider() : id = Uuid().v4(), cheaperModel = CheaperModel(), expensiveModel = ExpensiveModel();

  @override
  void notifyListeners() {
    id = Uuid().v4();
    super.notifyListeners();
  }

  void start(){
    cheaperModelSubscription = Stream.periodic(const Duration(seconds: 1)).listen((event){
      cheaperModel = CheaperModel();
      notifyListeners();
    });
    expensiveModelSubscription = Stream.periodic(const Duration(seconds: 10)).listen((event){
      expensiveModel = ExpensiveModel();
      notifyListeners();
    });
  }

  void stop(){
    cheaperModelSubscription.cancel();
    expensiveModelSubscription.cancel();
  }
}