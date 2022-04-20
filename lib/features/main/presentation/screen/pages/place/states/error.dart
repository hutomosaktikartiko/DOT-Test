import 'package:flutter/material.dart';

import '../../../../../../../shared/config/size_config.dart';

class Error extends StatelessWidget {
  const Error({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.8,
      child: Center(
        child: Text(message ?? "Error"),
      ),
    );
  }
}
