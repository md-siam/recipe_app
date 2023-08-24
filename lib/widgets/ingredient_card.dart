import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/images/ingredients.png',
      height: 120,
      width: 120,
    );
  }
}