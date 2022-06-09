import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake/menu/bloc/menu_event.dart';
import 'package:snake/menu/bloc/menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(InitialState()) {
    on<PlayClick>((event, emit) => emit(InitialState()));
  }
}
