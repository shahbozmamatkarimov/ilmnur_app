import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/login/data/models/login_response.dart';
import 'package:ilmnur_app/features/login/domain/repositories/login_repo.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/login_service.dart';

class ImplLoginRepo extends LoginRepo {
  final LoginService loginService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplLoginRepo({required this.loginService});

  @override
  Future<DataState<LoginResponse>> googleLogin(
    Map<String, dynamic> user,
  ) async {
    try {
      final response = await loginService.googleLogin(user);
      if (response.response.statusCode == 200 ||
          response.response.statusCode == 201) {
        return DataSuccess(data: response.data);
      } else {
        return DataException.getError<LoginResponse>(
          response.response.statusMessage ?? "Login failed",
        );
      }
    } catch (e) {
      return DataException.getError<LoginResponse>(e);
    }
  }
}
