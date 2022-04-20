import 'package:flutter/material.dart';

import '../../../../../../../shared/config/custom_text_style.dart';
import '../../../../../../../shared/widgets/custom_box_shadow.dart';
import '../../../../../../../shared/widgets/show_image/show_image_network.dart';
import '../../../../../data/models/place_model.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  final PlaceModel? place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          CustomBoxShadow.defaultBoxShadow(),
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowImageNetwork(
            imageUrl: place?.image ?? "",
            width: 100,
            height: 80,
            borderRadius: BorderRadius.circular(5),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place?.title ?? "-",
                  style: CustomTextStyle.gray2TextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  place?.content ?? "-",
                  style: CustomTextStyle.gray2TextStyle.copyWith(
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
