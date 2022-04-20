import 'package:flutter/material.dart';

import '../../presentation/screen/pages/gallery/gallery_page.dart';
import '../../presentation/screen/pages/place/place_page.dart';
import '../../presentation/screen/pages/user/user_page.dart';

class TabModel {
  int? id;
  String? label;
  Widget? page;

  TabModel({
    this.id,
    this.label,
    this.page,
  });
}

final List<TabModel> mockListTabsModel = [
  TabModel(
    id: 1,
    label: "Place",
    page: PlacePage(),
  ),
  TabModel(
    id: 2,
    label: "Gallery",
    page: GalleryPage(),
  ),
  TabModel(
    id: 3,
    label: "User",
    page: UserPage(),
  ),
];