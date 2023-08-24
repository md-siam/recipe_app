import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import '../services/get_recipe_data.dart';

class RecipeInfoProvider extends ChangeNotifier {
  List<RecipeModel>? recipeList;
  bool isLoading = false;

  getPhotoData(String query) async {
    isLoading = true;
    recipeList = await getRecipeData(query);
    // debugPrint('Provider: ${recipeList} recipe');
    isLoading = false;

    notifyListeners();
  }
}
