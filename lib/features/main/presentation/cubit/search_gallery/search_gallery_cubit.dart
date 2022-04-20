import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/gallery_model.dart';

part 'search_gallery_state.dart';

class SearchGalleryCubit extends Cubit<SearchGalleryState> {
  SearchGalleryCubit() : super(SearchGalleryInitial());

  void searchGallery({
    required List<GalleryModel>? galleries,
    required String searchText,
  }) {
    List<GalleryModel> results = [];
    for (final GalleryModel? gallery in (galleries ?? [])) {
      if (gallery != null && gallery.caption != null) {
        if (gallery.caption!.toLowerCase().contains(searchText.toLowerCase())) {
          results.add(gallery);
        }
      }
    }

    if(results.length > 0) {
      emit(SearchGalleryLoaded(galleries: results));
    } else {
      emit(SearchGalleryEmpty());
    }
  }
}
