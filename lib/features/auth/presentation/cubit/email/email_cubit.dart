import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitial());

  bool setEmail({required String email}) {
    if (email.isEmpty) {
      emit(EmailInvalid(error: "Email is required"));

      return false;
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      emit(EmailInvalid(error: "Email is invalid"));

      return false;
    } else {
      emit(EmailValid());

      return true;
    }
  }
}
