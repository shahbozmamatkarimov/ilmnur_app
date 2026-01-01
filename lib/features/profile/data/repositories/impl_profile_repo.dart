import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/profile/data/models/profile.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/profile_service.dart';

class ImplProfileRepo extends ProfileRepo {
  final ProfileService profileService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplProfileRepo({required this.profileService});

  @override
  Future<DataState<Profile>> getProfile(int id) async {
    try {
      final response = await profileService.getProfile(id);
      return DataSuccess<Profile>(data: response.data);
    } catch (e) {
      return DataException.getError<Profile>(e);
    }
  }
}
