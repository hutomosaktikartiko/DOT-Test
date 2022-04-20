import 'package:flutter/material.dart';

import '../../../../../../../shared/config/size_config.dart';
import '../../../../../../../shared/widgets/custom_shimmer.dart';
import '../widgets/place_shimmer_widget.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          CustomShimmer.circular(
            width: SizeConfig.screenWidth,
            height: 50,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...[1, 2, 3, 4, 5]
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: PlaceShimmerWidget(),
                  ),
                ),
              )
              .values
              .toList(),
        ],
      ),
    );
  }
}
