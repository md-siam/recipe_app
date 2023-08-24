import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const IngredientCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'asset/images/ingredients.png',
          height: 120,
          width: 120,
        ),
        Positioned(
          top: 30,
          child: FittedBox(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          child: FittedBox(
            child: Text(
              subtitle,
            ),
          ),
        ),
      ],
    );
  }
}
