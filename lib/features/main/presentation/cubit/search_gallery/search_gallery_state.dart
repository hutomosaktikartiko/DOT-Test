part of 'search_gallery_cubit.dart';

abstract class SearchGalleryState extends Equatable {
  const SearchGalleryState();

  @override
  List<Object> get props => [];
}

class SearchGalleryInitial extends SearchGalleryState {}

class SearchGalleryLoaded extends SearchGalleryState {
  final List<GalleryModel> galleries;

  SearchGalleryLoaded({required this.galleries});

  @override
  List<Object> get props => [galleries];
}

class SearchGalleryEmpty extends SearchGalleryState {}