abstract class ChatScreenEvent {
  const ChatScreenEvent();
}

class LoadChat extends ChatScreenEvent {
  final String uid;

  const LoadChat(this.uid);
}
