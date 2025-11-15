import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'duty_state.dart';

class DutyCubit extends Cubit<DutyState> {
  DutyCubit() : super(DutyOffDuty());

  void checkIn() {
    emit(DutyOnDuty());
  }

  void checkOut() {
    emit(DutyOffDuty());
  }
}
