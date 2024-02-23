part of 'agency_update_bloc.dart';

abstract class AgencyUpdateEvent extends Equatable {
  const AgencyUpdateEvent();

  @override
  List<Object> get props => [];
}

class UpdateAgencyData extends AgencyUpdateEvent {
  final AgencyModel agencyModel;

  UpdateAgencyData(this.agencyModel);

  @override
  List<Object> get props => [agencyModel];
}
