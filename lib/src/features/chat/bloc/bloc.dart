import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapp/src/features/chat/domain/chat_repository.dart';

import 'event.dart';
import 'state.dart';

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  final ChatRepository _chatRepository;

  ChatScreenBloc(this._chatRepository, FirebaseAuth _auth)
    : super(
        ChatScreenState(
          currentUserId:
              _auth.currentUser?.providerData.firstOrNull?.uid ?? 'no user',
        ),
      ) {
    on<LoadChat>(_onLoadChat);
  }

  Future<void> _onLoadChat(
    LoadChat event,
    Emitter<ChatScreenState> emit,
  ) async {
    final messages = await _chatRepository.getMessages(event.uid);

    emit(state.copyWith(messages: messages));
  }
}
