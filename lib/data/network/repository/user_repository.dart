import 'dart:async';

import 'package:bongtuyettrang/data/responses/auth/user_response.dart';

class UserRepository {
  UserResponse? _userResponse;

  Future<UserResponse> getUser() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_userResponse == null) {
      throw Exception('User not found');
    }
    return _userResponse!;
  }

}
