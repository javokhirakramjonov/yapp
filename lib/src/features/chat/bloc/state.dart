import 'package:yapp/src/features/chat/model/message.dart';

class ChatScreenState {
  final String currentUserId;
  final List<Message> messages;

  ChatScreenState({this.messages = const [], required this.currentUserId});

  ChatScreenState copyWith({String? currentUserId, List<Message>? messages}) {
    return ChatScreenState(
      currentUserId: currentUserId ?? this.currentUserId,
      messages: messages ?? this.messages,
    );
  }
}
