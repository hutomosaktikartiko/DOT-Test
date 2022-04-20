part of 'password_cubit.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordValid extends PasswordState {}

class PasswordInvalid extends PasswordState {
  final String error;

  PasswordInvalid({required this.error});

  @override
  List<Object> get props => [error];
}