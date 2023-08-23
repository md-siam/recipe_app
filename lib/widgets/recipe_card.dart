import 'package:flutter/material.dart';

import '../core/app_color.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 248, 248),
        border: Border.all(
          color: AppColors.kLightGrey,
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://hot-thai-kitchen.com/wp-content/uploads/2022/05/cashew-chicken-sq.jpg',
              ),
              const Positioned(
                top: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Text(
                    'Chicken Buffet',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3.0, left: 5.0),
                  child: Text(
                    'Serious Eats',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '520',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                Text(
                  '  CAL',
                  style: TextStyle(
                    color: AppColors.kDeepGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                VerticalDivider(
                  thickness: 2,
                  color: Color.fromARGB(255, 198, 195, 195),
                ),
                Text(
                  '5',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                Text(
                  '  INGR',
                  style: TextStyle(
                    color: AppColors.kDeepGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
