import 'package:flutter/material.dart';

import '../../../../../../../shared/config/size_config.dart';
import '../../../../../../../shared/widgets/custom_shimmer.dart';

class PlaceShimmerWidget extends StatelessWidget {
  const PlaceShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShimmer.circular(
          width: 100,
          height: 80,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmer.circular(
                width: SizeConfig.screenWidth,
                height: 20,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomShimmer.circular(
                width: SizeConfig.screenWidth,
                height: 30,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
