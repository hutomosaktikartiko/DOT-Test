part of 'place_cubit.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object?> get props => [];
}

class PlaceInitial extends PlaceState {}

class PlaceLoading extends PlaceState {}

class PlaceLoaded extends PlaceState {
  final List<PlaceModel>? places;

  const PlaceLoaded({
    required this.places,
  });

  @override
  List<Object?> get props => [places];
}

class PlaceEmpty extends PlaceState {}

class PlaceError extends PlaceState {
  final String? message;

  const PlaceError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
