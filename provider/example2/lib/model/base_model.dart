import 'package:uuid/uuid.dart';

class BaseModel{
  final String id;
  final String updatedTime;

  BaseModel() : id = Uuid().v4(), updatedTime = DateTime.now().toString();

  @override
  bool operator ==(covariant BaseModel other) => id == other.id;

  @override
  int get hashCode => id.hashCode;

}

class CheaperModel extends BaseModel {}

class ExpensiveModel extends BaseModel {}