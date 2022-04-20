import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/models/return_value_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.userRepository,
  }) : super(UserInitial());

  final UserRepository userRepository;

  Future<void> getUser() async {
    emit(UserLoading());
    final ReturnValueModel<UserModel> result = await userRepository.getUser();

    if (result.isSuccess) {
      emit(UserLoaded(user: result.value));
    } else {
      emit(UserError(message: result.message));
    }
  }
}
