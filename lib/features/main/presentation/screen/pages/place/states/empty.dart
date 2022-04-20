import 'package:flutter/material.dart';

import '../../../../../../../shared/config/size_config.dart';

class Empty extends StatelessWidget {
  const Empty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.8,
      child: Center(
        child: Text("Empty"),
      ),
    );
  }
}
