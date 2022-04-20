class PlaceModel {
  int? id;
  String? title, content, image;
  List<String?>? media;

  PlaceModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.media,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      image: (json["image"] == null) ? setImage(json["media"] ?? null) : json['image'],
      media: (json["media"] is List) ? json["media"].cast<String>() : null,
    );
  }

  static String? setImage(List? media){
    return media?.first;
  }
}