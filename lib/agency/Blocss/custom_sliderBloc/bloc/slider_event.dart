part of 'slider_bloc.dart';

sealed class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}
class changeEvent extends SliderEvent {
 int index;
 changeEvent(this.index);
  @override
  List<Object> get props => [index];
}