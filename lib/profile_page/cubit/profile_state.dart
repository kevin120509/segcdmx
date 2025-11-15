part of 'profile_cubit.dart';

abstract class ProfileState with EquatableMixin {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}
