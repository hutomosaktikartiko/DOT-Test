import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/place_model.dart';

part 'search_place_state.dart';

class SearchPlaceCubit extends Cubit<SearchPlaceState> {
  SearchPlaceCubit() : super(SearchPlaceInitial());

  void searchPlace({
    required List<PlaceModel?>? places,
    required String searchText,
  }) {
    List<PlaceModel> results = [];
    for (final PlaceModel? place in (places ?? [])) {
      if (place != null && place.title != null) {
        if (place.title!.toLowerCase().contains(searchText.toLowerCase())) {
          results.add(place);
        }
      }
    }

    if(results.length > 0) {
      emit(SearchPlaceLoaded(places: results));
    } else {
      emit(SearchPlaceEmpty());
    }
  }
}
