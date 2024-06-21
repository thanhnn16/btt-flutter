part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String token;
  final bool isLoading;

  const AuthState({required this.token, this.isLoading = false});

  AuthState copyWith({
    String? token,
    bool? isLoading,
  }) {
    return AuthState(
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [token, isLoading];
}
