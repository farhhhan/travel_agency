import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_agency/agency/Model/agencyModel.dart';
import 'package:travel_agency/agency/Repositrys/agenchyRepo.dart';
part 'agency_update_event.dart';
part 'agency_update_state.dart';

class AgencyUpdateBloc extends Bloc<AgencyUpdateEvent, AgencyUpdateState> {
  final Agencyrepositry agencyRepository;
  AgencyUpdateBloc(this.agencyRepository) : super(UpdationInitial()) {
    on<UpdateAgencyData>((event, emit) async {
      try {
        emit(UpdationLoading());
        await agencyRepository.updateAgency(event.agencyModel);
        emit(UpdationSuccess());
      } catch (e) {
        emit(UpdationFailure(error: e.toString()));
      }
    });
  }
}
