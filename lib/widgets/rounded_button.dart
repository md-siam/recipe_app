import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/app_color.dart';

class RoundedButton extends StatelessWidget {
  final String imageLink;
  final VoidCallback onTapEvent;
  const RoundedButton({
    Key? key,
    required this.imageLink,
    required this.onTapEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapEvent,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.kGreen,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SvgPicture.asset(
          imageLink,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
