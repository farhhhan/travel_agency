import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_agency/agency/Model/agencyModel.dart';
import 'package:travel_agency/agency/Repositrys/agenchyRepo.dart';

part 'agency_event.dart';
part 'agency_state.dart';

class AgencyBloc extends Bloc<AgencyEvent, AgencyState> {
  final Agencyrepositry agencyrepositry;
  AgencyBloc(this.agencyrepositry) : super(AgencyState()) {
    on<GetAgencyData>((event, emit)async {
       emit(AgencyLoadingState());
       await Future.delayed(Duration(milliseconds: 100));
       try{
          final data=await agencyrepositry.get();
          print(data);
          emit(AgencyLodedState(data));
       }catch(e){
         print(e.toString());
       }
    });
  }
}
