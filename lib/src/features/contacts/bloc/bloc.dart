import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class ContactsScreenBloc
    extends Bloc<ContactsScreenEvent, ContactsScreenState> {
  ContactsScreenBloc() : super(ContactsScreenState());
}
