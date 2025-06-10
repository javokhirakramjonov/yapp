import 'package:get_it/get_it.dart';
import 'package:yapp/src/features/auth/domain/auth_repository.dart';

void setupAuthScreenDependencies() {
  GetIt.I.registerSingleton(
    AuthRepository(GetIt.I.get(), GetIt.I.get(), GetIt.I.get()),
  );
}
