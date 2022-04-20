import 'package:flutter/material.dart';

import '../../../../../../../shared/config/size_config.dart';
import '../../../../../../../shared/widgets/custom_shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          width: SizeConfig.screenWidth,
          child: Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            children: [
              ...[1, 2, 3, 4, 5, 6]
                  .asMap()
                  .map(
                    (key, value) => MapEntry(
                      key,
                      CustomShimmer.circular(
                        height: SizeConfig.screenWidth * 0.28,
                        width: SizeConfig.screenWidth * 0.28,
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
