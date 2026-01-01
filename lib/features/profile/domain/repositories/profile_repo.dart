import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/profile/data/models/profile.dart';

abstract class ProfileRepo {
  Future<DataState<Profile>> getProfile(int id);
}
