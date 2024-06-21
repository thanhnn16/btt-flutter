class RegisterRequest {
  final String fullName;
  final String phoneNumber;
  final String password;

  RegisterRequest({
    required this.fullName,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'RegisterRequest{fullName: $fullName, phoneNumber: $phoneNumber, password: $password}';
  }
}
