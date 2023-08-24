import 'package:flutter/material.dart';

import '../core/app_color.dart';

class DeepLabel extends StatelessWidget {
  final String label;
  const DeepLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.kBoldTextColor,
          ),
        ),
        SizedBox(
          width: double.parse(label.length.toString()) * 10,
          child: const Divider(
            thickness: 2,
            color: AppColors.kBoldTextUnderLineColor,
          ),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
