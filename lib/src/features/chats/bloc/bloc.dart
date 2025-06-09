import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class ChatsScreenBloc extends Bloc<ChatsScreenEvent, ChatsScreenState> {
  ChatsScreenBloc() : super(ChatsScreenState());
}
