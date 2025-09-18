import 'package:example_1/Model/users_model.dart';

abstract class UsersStateClass {}

class ProductInitial extends UsersStateClass{}
class ProductLoading extends UsersStateClass{}
class ProductLoaded extends UsersStateClass{
  final List<Users> user;
  ProductLoaded(this.user);
}
class ProductError extends UsersStateClass{
  final String message;
  ProductError(this.message);
}