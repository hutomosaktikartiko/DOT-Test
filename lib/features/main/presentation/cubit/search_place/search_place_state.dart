part of 'search_place_cubit.dart';

abstract class SearchPlaceState extends Equatable {
  const SearchPlaceState();

  @override
  List<Object> get props => [];
}

class SearchPlaceInitial extends SearchPlaceState {}

class SearchPlaceLoaded extends SearchPlaceState {
  final List<PlaceModel> places;

  const SearchPlaceLoaded({
    required this.places,
  });

  @override
  List<Object> get props => [places];
}

class SearchPlaceEmpty extends SearchPlaceState {}