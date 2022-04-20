import '../../../../core/models/return_value_model.dart';
import '../../../../core/network/network_info.dart';
import '../../../../shared/config/label_config.dart';
import '../datasources/place_remote_data_source.dart';
import '../models/place_model.dart';

abstract class PlaceRepository {
  Future<ReturnValueModel<List<PlaceModel>>> getPlace();
}

class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceRemoteDataSource placeRemoteDataSource;
  final NetworkInfo networkInfo;

  PlaceRepositoryImpl({
    required this.placeRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ReturnValueModel<List<PlaceModel>>> getPlace() async {
    if (await networkInfo.isConnected) {
      try {
        final List<PlaceModel> place = await placeRemoteDataSource.getPlace();

        return ReturnValueModel(
          isSuccess: true,
          value: place,
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
