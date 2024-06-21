part of 'auth_cubit.dart';

class AuthState {
  final String token;
  final bool isLoading;

  AuthState({required this.token, this.isLoading = false});

  AuthState copyWith({
    String? token,
    bool? isLoading,
  }) {
    return AuthState(
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
