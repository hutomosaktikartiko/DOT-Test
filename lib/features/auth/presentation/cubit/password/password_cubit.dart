import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());

  bool setPassword({required String password}) {
    if (password.isEmpty) {
      emit(PasswordInvalid(error: "Password is required"));

      return false;
    } else if (password.trim().length < 6) {
      emit(PasswordInvalid(error: "Password must be at least 6 characters"));

      return false;
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      emit(PasswordInvalid(
          error: "Password must be at least 1 uppercase letter"));

      return false;
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      emit(PasswordInvalid(
          error: "Password must be at least 1 lowercase letter"));

      return false;
    } else {
      emit(PasswordValid());

      return true;
    }
  }
}
