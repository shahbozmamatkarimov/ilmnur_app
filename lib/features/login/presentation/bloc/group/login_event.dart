part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GoogleLogin extends LoginEvent {
  final Map<String, dynamic> userCredential;
  // yoki
  // final User firebaseUser;

  const GoogleLogin(this.userCredential);
  // yoki const GoogleLogin(this.firebaseUser);

  @override
  List<Object?> get props => [userCredential];
}
