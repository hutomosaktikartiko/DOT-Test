import 'package:dio/dio.dart';

import '../models/gallery_model.dart';

abstract class GalleryRemoteDataSource {
  Future<List<GalleryModel>> getGallery();
}

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  final Dio dio;

  GalleryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<GalleryModel>> getGallery() async {
    try {
      final response = await dio.get('gallery.json');

      List results = response.data['data'];

      return results.map((result) => GalleryModel.fromJson(result)).toList();
    } on DioError catch (error) {
      throw error;
    }
  }
}