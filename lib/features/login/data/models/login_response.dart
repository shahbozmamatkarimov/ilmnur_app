class LoginResponse {
  final String token;
  final User data;

  LoginResponse({required this.token, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] ?? json['accessToken'] ?? '',
      data: User.fromJson(json['user'] ?? json['data'] ?? {}),
    );
  }
}

class User {
  final String name;
  final String email;
  final String? photoUrl;

  User({required this.name, required this.email, this.photoUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? json['displayName'] ?? 'No name',
      email: json['email'] ?? '',
      photoUrl: json['photoUrl'],
    );
  }
}
