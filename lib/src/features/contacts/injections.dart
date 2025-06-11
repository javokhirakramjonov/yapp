import 'package:get_it/get_it.dart';
import 'package:yapp/src/features/contacts/domain/contacts_repository.dart';

void initContactsScreenDependencies() {
  GetIt.I.registerSingleton(ContactsRepository(GetIt.I.get(), GetIt.I.get()));
}
