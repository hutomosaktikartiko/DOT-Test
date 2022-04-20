import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/models/return_value_model.dart';
import '../../../data/models/place_model.dart';
import '../../../data/repositories/place_repository.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  PlaceCubit({
    required this.placeRepository,
  }) : super(PlaceInitial());

  final PlaceRepository placeRepository;

  Future<void> getPlace() async {
    emit(PlaceLoading());
    final ReturnValueModel<List<PlaceModel>> result = await placeRepository.getPlace();

    if (result.isSuccess) {
      if ((result.value?.length ?? 0) > 0) {
        emit(PlaceLoaded(places: result.value));
      } else {
        emit(PlaceEmpty());
      }
    } else {
      emit(PlaceError(message: result.message));
    }
  }
}
