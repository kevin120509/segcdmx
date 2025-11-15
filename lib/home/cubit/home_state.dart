part of 'home_cubit.dart';

abstract class HomeState with EquatableMixin {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
