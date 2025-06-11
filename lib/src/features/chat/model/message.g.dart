// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  fromUid: json['fromUid'] as String,
  toUid: json['toUid'] as String,
  message: json['message'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'fromUid': instance.fromUid,
  'toUid': instance.toUid,
  'message': instance.message,
  'timestamp': instance.timestamp.toIso8601String(),
};
