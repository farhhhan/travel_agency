part of 'slider_bloc.dart';

 class SliderState extends Equatable {
  int index;
   SliderState({ this.index=1});

   SliderState copyWith({required int index}){
    return SliderState(index: index ?? this.index);
   }
  
  @override
  List<Object> get props => [index];
 }