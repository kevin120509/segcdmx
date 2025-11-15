import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'incident_confirmation_state.dart';

class IncidentConfirmationCubit extends Cubit<IncidentConfirmationState> {
  IncidentConfirmationCubit() : super(ConfirmationInitial());

  void showConfirmation(bool isOffline) {
    if (isOffline) {
      emit(const ConfirmationOffline());
    } else {
      emit(const ConfirmationSuccess());
    }
  }
}
