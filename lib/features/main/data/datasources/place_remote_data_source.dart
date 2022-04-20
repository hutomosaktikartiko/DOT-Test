import 'package:dio/dio.dart';

import '../models/place_model.dart';

abstract class PlaceRemoteDataSource {
  Future<List<PlaceModel>> getPlace();
}

class PlaceRemoteDataSourceImpl implements PlaceRemoteDataSource {
  final Dio dio;

  PlaceRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PlaceModel>> getPlace() async {
    try {
      final response = await dio.get('place.json');
      
      List results = response.data['data']['content'];
      
      return results.map((result) => PlaceModel.fromJson(result)).toList();
    } on DioError catch (error) {
      throw error;
    }
  }
}