import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class DashboardScreenBloc
    extends Bloc<DashboardScreenEvent, DashboardScreenState> {
  DashboardScreenBloc() : super(DashboardScreenState());
}
