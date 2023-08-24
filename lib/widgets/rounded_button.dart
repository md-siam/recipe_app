import 'package:flutter/material.dart';

import '../core/app_color.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTapEvent;
  const RoundedButton({
    Key? key,
    required this.icon,
    required this.onTapEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapEvent,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: AppColors.kGreen,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          // size: 20,
        ),
      ),
    );
  }
}
