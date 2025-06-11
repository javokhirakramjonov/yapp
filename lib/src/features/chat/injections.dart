import 'package:get_it/get_it.dart';
import 'package:yapp/src/features/chat/domain/chat_repository.dart';

void initChatScreenDependencies() {
  GetIt.I.registerSingleton(ChatRepository(GetIt.I.get(), GetIt.I.get()));
}
