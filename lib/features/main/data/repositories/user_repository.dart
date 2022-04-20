import '../../../../core/models/return_value_model.dart';
import '../../../../core/network/network_info.dart';
import '../../../../shared/config/label_config.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';

abstract class UserRepository {
  Future<ReturnValueModel<UserModel>> getUser();
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ReturnValueModel<UserModel>> getUser() async {
    if (await networkInfo.isConnected) {
      try {
        final UserModel user = await userRemoteDataSource.getUser();

        return ReturnValueModel(
          isSuccess: true,
          value: user,
        );
      } catch (error) {
        return ReturnValueModel(
          message: error.toString(),
        );
      }
    } else {
      return ReturnValueModel(
        message: LabelConfig.noInternet,
      );
    }
  }
}
