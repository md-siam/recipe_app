import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/recipe_detail_page.dart';

import '../core/app_color.dart';
import '../view_models/recipe_info_provider.dart';
import '../widgets/empty_search.dart';
import '../widgets/recipe_card.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final TextEditingController _controller = TextEditingController();
  late final RecipeInfoProvider photoModel;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
    photoModel = Provider.of<RecipeInfoProvider>(context, listen: false);
    photoModel.getPhotoData('duck');
  }

  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      if (kDebugMode) {
        log(err.toString());
      }
    }
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
                _controller.clear();
              },
            )
          ],
          // onChanged: (newValue) {
          //   print(newValue);
          // },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: _isConnected
          ? Consumer<RecipeInfoProvider>(
              builder: (context, provider, child) {
                return photoModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(8)
                            .copyWith(top: 15, bottom: 0),
                        child: _customGripViewBuilder(provider),
                      );
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
              childAspectRatio: .87,
            ),
            itemBuilder: (BuildContext context, int index) {
              final recipeData = provider.recipeList![index].recipe!;

              return Hero(
                tag: index,
                child: GestureDetector(
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
                          index: index,
                          label: '${recipeData.label}',
                          imageLink: '${recipeData.image}',
                          source: '${recipeData.source}',
                          healthLabel: recipeData.healthLabels,
                          cuisineType: recipeData.cuisineType,
                          ingredientLines: recipeData.ingredientLines,
                          calories: recipeData.calories,
                          servings: recipeData.yield,
                          totalDaily: recipeData.totalDaily,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
