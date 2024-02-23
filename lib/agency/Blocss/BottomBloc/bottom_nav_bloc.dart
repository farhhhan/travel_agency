import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState()) {
    on<changeEvent>(_changeIndex);
  }

  FutureOr<void> _changeIndex(changeEvent event, Emitter<BottomNavState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
