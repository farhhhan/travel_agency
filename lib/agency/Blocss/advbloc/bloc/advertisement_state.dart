part of 'advertisement_bloc.dart';

 class AdvertisementState extends Equatable {
  const AdvertisementState();
  
  @override
  List<Object> get props => [];
}


class AdvLoadingState extends AdvertisementState{

  @override
  List<Object> get props => [];
}

class AdvLodedState extends AdvertisementState{
  List<Ad> advData;
   AdvLodedState(this.advData);
  @override
  List<Object> get props => [advData];
}