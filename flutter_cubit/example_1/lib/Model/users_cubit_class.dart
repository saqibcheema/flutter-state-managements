import 'package:example_1/Model/users_state_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Data/users_list.dart';

class UsersCubitClass extends Cubit<UsersStateClass>{
  UsersCubitClass() : super(ProductInitial());

  Future<void> fetchUsers()async{
    emit(ProductLoading());
    try{
      await Future.delayed(const Duration(seconds: 1));
      emit(ProductLoaded(users));
    }catch(e){
      emit(ProductError(e.toString()));
  }
  }
}