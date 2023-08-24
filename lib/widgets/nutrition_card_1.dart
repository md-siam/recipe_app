import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_color.dart';

class NutritionCard1 extends StatelessWidget {
  const NutritionCard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('asset/images/nutrition_card_1.png'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _infoSection('136', 'CAL / SERV'),
            const SizedBox(
              height: 50,
              child: VerticalDivider(
                thickness: 2,
                color: AppColors.kBoldTextColor,
              ),
            ),
            _infoSection('7%', 'DAILY VALUE'),
            const SizedBox(
              height: 50,
              child: VerticalDivider(
                thickness: 2,
                color: AppColors.kBoldTextColor,
              ),
            ),
            _infoSection('8', 'SERVINGS'),
          ],
        ),
      ],
    );
  }

  Widget _infoSection(String value, String subtitle) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          decoration: BoxDecoration(
            color: AppColors.kLightGrey,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(-1, 1),
              ),
            ],
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
