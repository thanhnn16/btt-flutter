// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as String,
      userId: json['userId'] as String,
      message: json['message'] as String,
      isRead: json['isRead'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'message': instance.message,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
