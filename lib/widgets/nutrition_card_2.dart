import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/app_color.dart';
import '../models/recipe_model.dart';

class NutritionCard2 extends StatelessWidget {
  final List<Digest>? digest;
  const NutritionCard2({
    Key? key,
    this.digest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: digest!.length,
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
                  tabs: List.generate(
                    digest!.length,
                    (index) => Tab(text: digest![index].label),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Stack(
            children: [
              Image.asset(
                'asset/images/nutrition_card_2.png',
                height: 150,
              ),
              SizedBox(
                height: 150,
                child: TabBarView(
                  children: List.generate(
                    digest!.length,
                    (index) {
                      return _digestInformation(
                        '${digest![index].label}',
                        digest![index].total,
                        digest![index].daily,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _digestInformation(String label, double? total, double? daily) {
    double percentage = ((total! - daily!) / total) * 100;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5.0),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              'asset/images/arrow_down.svg',
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 100,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${total.toString().split('.').first}g',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Text(
                        '${percentage.toString().split('.').first}%',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 130,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
