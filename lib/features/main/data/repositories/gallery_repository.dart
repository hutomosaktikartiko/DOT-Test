import '../../../../core/models/return_value_model.dart';
import '../../../../core/network/network_info.dart';
import '../../../../shared/config/label_config.dart';
import '../datasources/gallery_remote_data_source.dart';
import '../models/gallery_model.dart';

abstract class GalleryRepository {
  Future<ReturnValueModel<List<GalleryModel>>> getGallery();
}

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryRemoteDataSource galleryRemoteDataSource;
  final NetworkInfo networkInfo;

  GalleryRepositoryImpl({
    required this.galleryRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ReturnValueModel<List<GalleryModel>>> getGallery() async {
    if (await networkInfo.isConnected) {
      try {
        final List<GalleryModel> gallery =
            await galleryRemoteDataSource.getGallery();

        return ReturnValueModel(
          isSuccess: true,
          value: gallery,
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
