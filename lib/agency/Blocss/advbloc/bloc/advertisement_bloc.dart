import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_agency/agency/Model/advatisment.dart';
import 'package:travel_agency/agency/Repositrys/agency_ad.dart';

part 'advertisement_event.dart';
part 'advertisement_state.dart';

class AdvertisementBloc extends Bloc<AdvertisementEvent, AdvertisementState> {
  final AdvRepo advRepo;
  AdvertisementBloc(this.advRepo) : super(AdvertisementState()) {
    on<AdvertisementEvent>((event, emit)async {
      emit(AdvLoadingState());
       await Future.delayed(Duration(milliseconds: 100));
       try{
          final data=await advRepo.get();
          print(data);
          emit(AdvLodedState(data));
       }catch(e){
         print(e.toString());
       }
    });
  }
}
