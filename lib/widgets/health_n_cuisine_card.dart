import 'package:flutter/material.dart';

import '../core/app_color.dart';

class HealthNCuisineCard extends StatelessWidget {
  final List<String>? label;
  const HealthNCuisineCard({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      direction: Axis.horizontal,
      children: List.generate(
        label!.length,
        (index) => _design('${label?[index]}'),
      ),
    );
  }

  Widget _design(String label) {
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
