import 'package:equatable/equatable.dart';

import '../../../domain/models/user.dart';

class UserResponse extends Equatable {
  final String id;
  final String? fullName;
  final String phoneNumber;
  final DateTime createdAt;

  const UserResponse(this.id, this.fullName, this.phoneNumber, this.createdAt);

  @override
  List<Object?> get props => [id, fullName, phoneNumber];

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      json['id'],
      json['fullName'],
      json['phoneNumber'],
      DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }

  User toModel() {
    return User(
      id: id,
      fullName: fullName ?? '',
      phoneNumber: phoneNumber,
    );
  }
}
