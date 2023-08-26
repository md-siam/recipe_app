import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../core/app_color.dart';

class NutritionCard2 extends StatelessWidget {
  final String title;
  const NutritionCard2({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              elevation: 4.0,
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8.0,
                ),
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: StadiumBorder(),
                ),
                child: ButtonsTabBar(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.kGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  unselectedDecoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 13,
                    color: AppColors.kDeepGrey,
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  tabs: const [
                    Tab(text: "Fat"),
                    Tab(text: "Carbs"),
                    Tab(text: "Protein"),
                    Tab(text: "Cholesterol"),
                    Tab(text: "Vitamin"),
                    Tab(text: "Minerals"),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Stack(
            children: [
              Image.asset('asset/images/nutrition_card_2.png'),
              const SizedBox(
                height: 100,
                child: TabBarView(
                  children: [
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Image.asset('asset/images/nutrition_card_2.png'),
    //     Positioned(
    //       top: 10,
    //       left: 10,
    //       child: Row(
    //         children: [
    //           Text(
    //             title,
    //             style: const TextStyle(
    //               fontSize: 16,
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           const SizedBox(width: 5.0),
    //           SvgPicture.asset(
    //             'asset/images/arrow_down.svg',
    //             colorFilter: const ColorFilter.mode(
    //               Colors.black,
    //               BlendMode.srcIn,
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
