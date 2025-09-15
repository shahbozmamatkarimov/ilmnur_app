import 'package:ilmnur_app/features/user/data/models/user.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';

abstract class UserRepo {
  Future<DataState<User>> getUser(int id);
}
