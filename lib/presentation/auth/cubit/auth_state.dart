part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String token;
  final int statusCode;
  final bool isLoading;

  const AuthState(
      {required this.statusCode, required this.token, this.isLoading = false});

  AuthState copyWith({
    String? token,
    int? statusCode,
    bool? isLoading,
  }) {
    return AuthState(
      token: token ?? this.token,
      statusCode: statusCode ?? this.statusCode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [token, isLoading];
}
