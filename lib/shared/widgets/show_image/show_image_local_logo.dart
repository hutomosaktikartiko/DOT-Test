import 'package:dot_test/shared/config/asset_path_config.dart';
import 'package:flutter/material.dart';

class ShowImageLocalLogo extends StatelessWidget {
  const ShowImageLocalLogo({
    Key? key,
    this.height = 50,
    this.width = 50,
  }) : super(key: key);

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetPathConfig.dotLogo,
      height: height,
      width: width,
    );
  }
}
