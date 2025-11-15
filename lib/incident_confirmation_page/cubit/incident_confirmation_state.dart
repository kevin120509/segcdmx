part of 'incident_confirmation_cubit.dart';

abstract class IncidentConfirmationState extends Equatable {
  const IncidentConfirmationState();

  @override
  List<Object> get props => [];
}

class ConfirmationInitial extends IncidentConfirmationState {}

class ConfirmationSuccess extends IncidentConfirmationState {
  const ConfirmationSuccess();
}

class ConfirmationOffline extends IncidentConfirmationState {
  const ConfirmationOffline();
}
