import 'package:flutter/material.dart';

import '../../../../../../../shared/config/size_config.dart';
import '../../../../../../../shared/widgets/custom_shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomShimmer.circular(width: 150, height: 150),
          const SizedBox(
            height: 20,
          ),
          CustomShimmer.circular(
            width: SizeConfig.screenWidth,
            height: 30,
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
    );
  }
}
