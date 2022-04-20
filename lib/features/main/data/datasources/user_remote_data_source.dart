import 'package:dio/dio.dart';

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUser() async {
    try {
      final response = await dio.get('user.json');
      return UserModel.fromJson(response.data['data']);
    } on DioError catch (error) {
      throw error;
    }
  }
}