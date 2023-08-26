import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/recipe_model.dart';

Future<List<RecipeModel>> getRecipeData(String query) async {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://edamam-recipe-search.p.rapidapi.com/api/recipes/v2',
      headers: {
        'X-RapidAPI-Key': dotenv.env['X_RapidAPI_Key'],
        'X-RapidAPI-Host': dotenv.env['X_RapidAPI_Host'],
      },
    ),
  );
  List<RecipeModel> resultList = [];
  try {
    Response response = await dio.get(
      '',
      queryParameters: {
        'type': 'any',
        'q': query,
      },
    );

    // debugPrint('Response: ${response.data}');
    // debugPrint(response.statusCode);
    if (response.statusCode == 200) {
      resultList = (response.data['hits'] as List)
          .map((x) => RecipeModel.fromJson(x))
          .toList();

      // log('ResultList: ${resultList[0].recipe!.image}');
    } else {
      debugPrint('Error!');
    }
  } catch (e) {
    log(e.toString());
  }
  return resultList;
}
