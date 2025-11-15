part of 'equipment_cubit.dart';

abstract class EquipmentState with EquatableMixin {
  const EquipmentState();

  @override
  List<Object> get props => [];
}

class EquipmentInitial extends EquipmentState {}
