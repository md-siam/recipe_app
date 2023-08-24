import 'package:flutter/material.dart';

class NutritionCard2 extends StatelessWidget {
  const NutritionCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('asset/images/nutrition_card_2.png'),
        
      ],
    );
  }
}