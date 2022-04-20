part of 'gallery_cubit.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object?> get props => [];
}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GalleryLoaded extends GalleryState {
  final List<GalleryModel>? galleries;

  GalleryLoaded({required this.galleries});

  @override
  List<Object?> get props => [galleries];
}

class GalleryEmpty extends GalleryState {}

class GalleryError extends GalleryState {
  final String? message;

  GalleryError({required this.message});

  @override
  List<Object?> get props => [message];
}