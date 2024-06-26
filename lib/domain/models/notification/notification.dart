import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  final String id;
  final String userId;
  final String message;
  final bool isRead;
  final DateTime createdAt;
  final bool isDeleted;
  final DateTime updatedAt;

  const Notification({
    required this.id,
    required this.userId,
    required this.message,
    required this.isRead,
    required this.createdAt,
    required this.isDeleted,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
