import 'package:flutter/material.dart';

import '../core/app_color.dart';

class TabWidget extends StatelessWidget {
  final List<String>? dietLabels;
  final List<String>? healthLabel;
  const TabWidget({
    Key? key,
    this.dietLabels,
    this.healthLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String>? filterHealthLabel = health÷Label.contains('free')
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      direction: Axis.horizontal,
      children: List.generate(
        healthLabel!.length,
        (index) {
          return _design('${healthLabel?[index]},');
        },
      ),
    );
  }

  Widget _design(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 15,
        color: AppColors.kDeepGrey,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
