import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_color.dart';
import '../view_models/recipe_info_provider.dart';
import '../widgets/empty_search.dart';
import '../widgets/error_search.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_page.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final TextEditingController _controller = TextEditingController();
  late final RecipeInfoProvider photoModel;

  @override
  void initState() {
    super.initState();
    photoModel = Provider.of<RecipeInfoProvider>(context, listen: false);
    // photoModel.getPhotoData('duck');
  }

  @override
  void dispose() {
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.kDeepGrey),
        backgroundColor: AppColors.kLightGrey,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'asset/images/app_icon.png',
          ),
        ),
        title: SearchBar(
          padding: const MaterialStatePropertyAll(
            EdgeInsetsDirectional.only(start: 10, end: 0.0),
          ),
          hintStyle: MaterialStatePropertyAll(
            TextStyle(color: Colors.grey.shade600),
          ),
          leading: const Icon(Icons.search),
          hintText: 'Search...',
          controller: _controller,
          elevation: const MaterialStatePropertyAll(0.0),
          constraints: const BoxConstraints(
            maxHeight: 40,
          ),
          trailing: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _controller.clear();
                });
              },
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xFF6ACC00),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const Text(
                'Search',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                setState(() {
                  photoModel.getPhotoData(_controller.text);
                });
              },
            ),
          ),
        ],
      ),
      body: _controller.text.isNotEmpty
          ? Consumer<RecipeInfoProvider>(
              builder: (context, provider, child) {
                return photoModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.recipeList!.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8)
                                .copyWith(top: 15, bottom: 0),
                            child: _customGripViewBuilder(provider),
                          )
                        : const ErrorSearch();
              },
            )
          : const EmptySearch(),
    );
  }

  /// displays all the recipe in [grid view]
  ///
  ///
  _customGripViewBuilder(RecipeInfoProvider provider) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          GridView.builder(
            itemCount: provider.recipeList!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.87,
            ),
            itemBuilder: (BuildContext context, int index) {
              final recipeData = provider.recipeList![index].recipe!;

              return GestureDetector(
                child: RecipeCard(
                  label: '${recipeData.label}',
                  imageLink: '${recipeData.image}',
                  source: '${recipeData.source}',
                  cal: '${recipeData.calories}',
                  ingr: '${recipeData.ingredients!.length}',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RecipeDetailPage(
                        label: '${recipeData.label}',
                        imageLink: '${recipeData.image}',
                        source: '${recipeData.source}',
                        healthLabel: recipeData.healthLabels,
                        cuisineType: recipeData.cuisineType,
                        ingredientLines: recipeData.ingredientLines,
                        calories: recipeData.calories,
                        servings: recipeData.yield,
                        totalDaily: recipeData.totalDaily,
                        dietLabels: recipeData.dietLabels,
                        digest: recipeData.digest,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
