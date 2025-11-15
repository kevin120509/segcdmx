part of 'duty_cubit.dart';

abstract class DutyState extends Equatable {
  const DutyState();

  @override
  List<Object> get props => [];
}

class DutyInitial extends DutyState {}

class DutyOffDuty extends DutyState {}

class DutyOnDuty extends DutyState {}
