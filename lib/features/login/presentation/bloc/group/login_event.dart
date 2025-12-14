part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GoogleLogin extends LoginEvent {
  final Map<String, dynamic> userCredential;

  const GoogleLogin(this.userCredential);

  @override
  List<Object?> get props => [userCredential];
}
