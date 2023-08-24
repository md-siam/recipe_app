import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NutritionCard2 extends StatelessWidget {
  final String title;
  const NutritionCard2({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('asset/images/nutrition_card_2.png'),
        Positioned(
          top: 10,
          left: 10,
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5.0),
              SvgPicture.asset(
                'asset/images/arrow_down.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
