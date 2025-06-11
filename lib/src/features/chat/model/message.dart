import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String fromUid;
  final String toUid;
  final String message;
  final DateTime timestamp;

  Message({
    required this.fromUid,
    required this.toUid,
    required this.message,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @override
  String toString() {
    return 'Message(fromUid: $fromUid, toUid: $toUid, message: $message, timestamp: $timestamp)';
  }
}
