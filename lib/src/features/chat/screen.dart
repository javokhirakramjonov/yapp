import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapp/src/core/styling/font.dart';
import 'package:yapp/src/core/styling/theme.dart';
import 'package:yapp/src/features/chat/bloc/bloc.dart';
import 'package:yapp/src/features/chat/bloc/state.dart';
import 'package:yapp/src/shared/model/user.dart';

import 'bloc/event.dart';
import 'model/message.dart';
import 'screen_wrapper.dart';

class ChatScreen extends StatelessWidget {
  final User user;

  const ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ChatScreenWrapper(
      uid: user.uid,
      child: Scaffold(
        backgroundColor: context.appTheme.primarySurface,
        appBar: AppBar(
          title: Text(user.name, overflow: TextOverflow.ellipsis),
          centerTitle: false,
        ),
        body: SafeArea(
          child: BlocBuilder<ChatScreenBloc, ChatScreenState>(
            builder: (context, state) {
              return _buildMessages(
                context,
                state.currentUserId,
                state.messages,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMessages(
    BuildContext context,
    String currentUid,
    List<Message> messages,
  ) {
    if (messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('No messages yet. Start chatting!'),
            ElevatedButton(
              onPressed: () {
                context.read<ChatScreenBloc>().add(LoadChat(user.uid));
              },
              child: Text('Reload'),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final isSenderMe = messages[index].fromUid == currentUid;
        final message = messages[index];
        return Row(
          mainAxisAlignment: isSenderMe
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            isSenderMe
                ? _buildMyMessage(context, message)
                : _buildOtherMessage(context, message),
          ],
        );
      },
    );
  }

  Widget _buildMyMessage(BuildContext context, Message message) {
    return _buildMessage(
      const EdgeInsets.only(left: 40),
      message,
      context.appTheme.primary,
      context.appTheme.primarySurface,
    );
  }

  Widget _buildOtherMessage(BuildContext context, Message message) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 22.0,
          backgroundImage: NetworkImage(user.photoUrl),
        ),
        _buildMessage(
          const EdgeInsets.only(right: 40),
          message,
          context.appTheme.chatMessageBackground,
          context.appTheme.onSurface20,
        ),
      ],
    );
  }

  Widget _buildMessage(
    EdgeInsetsGeometry padding,
    Message message,
    Color backgroundColor,
    Color textColor,
  ) {
    return Padding(
      padding: padding,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.message,
              style: AppFont.style16W500.copyWith(color: textColor),
            ),
            const SizedBox(height: 4),
            Text(
              '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
              style: AppFont.style12W400,
            ),
          ],
        ),
      ),
    );
  }
}
