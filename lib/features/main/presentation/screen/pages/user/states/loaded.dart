import 'package:flutter/material.dart';

import '../../../../../../../shared/config/custom_text_style.dart';
import '../../../../../../../shared/widgets/show_image/show_image_network.dart';
import '../../../../../data/models/user_model.dart';

class Loaded extends StatelessWidget {
  const Loaded({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ShowImageNetwork(
              imageUrl: user?.avatar ?? "",
              height: 150,
              width: 150,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildUserItem(
            label: "Name",
            value: user?.fullname,
          ),
          const SizedBox(
            height: 10,
          ),
          buildUserItem(
            label: "Phone Number",
            value: user?.phone,
          ),
          const SizedBox(
            height: 10,
          ),
          buildUserItem(
            label: "Email",
            value: user?.email,
          ),
        ],
      ),
    );
  }

  Widget buildUserItem({
    required String label,
    required String? value,
  }) {
    return Row(
      children: [
        Text(
          label + ":",
          style: CustomTextStyle.gray1TextStyle.copyWith(
            fontSize: 17,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            value ?? "-",
            style: CustomTextStyle.gray1TextStyle.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
