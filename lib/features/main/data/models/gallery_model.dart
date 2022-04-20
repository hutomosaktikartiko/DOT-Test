class GalleryModel {
  String? caption, thumbnail, image;

  GalleryModel({
    this.caption,
    this.thumbnail,
    this.image,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      caption: json["caption"],
      thumbnail: json["thumbnail"],
      image: json["image"],
    );
  }
}
