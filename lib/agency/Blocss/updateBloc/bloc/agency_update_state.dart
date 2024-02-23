part of 'agency_update_bloc.dart';

abstract class AgencyUpdateState extends Equatable {
  const AgencyUpdateState();

  @override
  List<Object> get props => [];
}

class UpdationInitial extends AgencyUpdateState {}

class UpdationLoading extends AgencyUpdateState {}

class UpdationSuccess extends AgencyUpdateState {}

class UpdationFailure extends AgencyUpdateState {
  final String error;

  const UpdationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
