import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/login/data/models/login_response.dart';
import 'package:ilmnur_app/features/login/domain/repositories/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;
  int activeTabIndex = 0;
  late String idToken;
  late int id;

  LoginBloc({required this.loginRepo}) : super(LoginInitial()) {
    on<GoogleLogin>((event, emit) async {
      emit(Loading());
      try {
        final response = await loginRepo.googleLogin(event.userCredential);
        if (response is DataSuccess) {
          // lesson = response.data;
          LoginResponse? lesson = response.data;
          if (lesson != null) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', lesson.token);
            emit(LoadedLoginData(lesson: lesson, status: StateStatus.loaded));
          } else {
            emit(ErrorLoadingLoginData("Failed to load lesson data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load lesson data: $e';
        emit(ErrorLoadingLoginData(errorMessage));
      }
    });

    // add(GetLogins());
  }
}
