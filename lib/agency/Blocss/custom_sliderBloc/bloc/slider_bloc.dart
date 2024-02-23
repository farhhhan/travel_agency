import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<changeEvent>(changeIndex);
  }

  FutureOr<void> changeIndex(changeEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
