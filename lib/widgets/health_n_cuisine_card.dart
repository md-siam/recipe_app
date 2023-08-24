import 'package:flutter/material.dart';

import '../core/app_color.dart';

class HealthNCuisineCard extends StatelessWidget {
  final String label;
  const HealthNCuisineCard({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label),
    );
  }
}
