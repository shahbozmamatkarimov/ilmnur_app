import 'package:firebase_auth/firebase_auth.dart';
import 'package:ilmnur_app/features/login/data/models/login_response.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';

abstract class LoginRepo {
  Future<DataState<LoginResponse>> googleLogin(Map<String, dynamic> credential);
}
