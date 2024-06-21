import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  final String? token;
  final String message;
  final int statusCode;

  const AuthResponse(this.token, this.message, this.statusCode);

  @override
  List<Object?> get props => [token, message, statusCode];

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      json['token'],
      json['message'],
      json['statusCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'message': message,
      'statusCode': statusCode,
    };
  }
}
