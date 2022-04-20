import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/models/return_value_model.dart';
import '../../../data/models/gallery_model.dart';
import '../../../data/repositories/gallery_repository.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({
    required this.galleryRepository,
  }) : super(GalleryInitial());

  final GalleryRepository galleryRepository;

  Future<void> getGallery() async {
    emit(GalleryLoading());

    final ReturnValueModel<List<GalleryModel>> result = await galleryRepository.getGallery();

    if (result.isSuccess) {
      if ((result.value?.length ?? 0) > 0) {
        emit(GalleryLoaded(galleries: result.value));
      } else {
        emit(GalleryEmpty());
      }
    } else {
      emit(GalleryError(message: result.message));
    }
  }
}
