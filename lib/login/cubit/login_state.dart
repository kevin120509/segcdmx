part of 'login_cubit.dart';

abstract class LoginState with EquatableMixin {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
