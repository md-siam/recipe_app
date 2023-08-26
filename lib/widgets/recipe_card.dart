import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/app_color.dart';

class RecipeCard extends StatelessWidget {
  final String label;
  final String imageLink;
  final String source;
  final String cal;
  final String ingr;
  const RecipeCard({
    Key? key,
    required this.label,
    required this.imageLink,
    required this.source,
    required this.cal,
    required this.ingr,
  }) : super(key: key);

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
              CachedNetworkImage(
                imageUrl: imageLink,
                placeholder: (context, url) => Image.asset(
                  'asset/images/image_placeholder.png',
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
              // Image.network(imageLink),
              Positioned(
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0, left: 5.0),
                  child: Text(
                    source,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 241, 238, 238),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cal.split('.').first,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
                const Text(
                  '  CAL',
                  style: TextStyle(
                    color: AppColors.kDeepGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const VerticalDivider(
                  thickness: 2,
                  color: Color.fromARGB(255, 198, 195, 195),
                ),
                Text(
                  ingr,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
                const Text(
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
