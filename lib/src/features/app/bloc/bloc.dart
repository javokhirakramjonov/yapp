import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class AppScreenBloc extends Bloc<AppScreenEvent, AppScreenState> {
  AppScreenBloc() : super(AppScreenState());
}
