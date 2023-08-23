import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_color.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: 100,
              color: AppColors.kDeepGrey,
            ),
            SizedBox(height: 10),
            Text(
              'Search For a Recipe',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.kDeepGrey,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
