part of 'email_cubit.dart';

abstract class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

class EmailInitial extends EmailState {}

class EmailValid extends EmailState {}

class EmailInvalid extends EmailState {
  final String error;

  EmailInvalid({required this.error});

  @override
  List<Object> get props => [error];
}