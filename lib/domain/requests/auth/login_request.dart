class LoginRequest {
  final String phoneNumber;
  final String password;

  LoginRequest({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'LoginRequest{phoneNumber: $phoneNumber, password: $password}';
  }
}
