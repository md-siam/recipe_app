import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:recipe_app/core/app_color.dart';

import '../widgets/deep_label.dart';
import '../widgets/health_n_cuisine_card.dart';
import '../widgets/ingredient_card.dart';
import '../widgets/light_label.dart';
import '../widgets/nutrition_card_1.dart';
import '../widgets/nutrition_card_2.dart';
import '../widgets/refine_search_text.dart';
import '../widgets/rounded_button.dart';

class RecipeDetailPage extends StatefulWidget {
  final String label;
  final String imageLink;
  final String source;
  final List<String>? healthLabel;
  final List<String>? cuisineType;
  final List<String>? ingredientLines;

  const RecipeDetailPage({
    Key? key,
    required this.label,
    required this.imageLink,
    required this.source,
    this.healthLabel,
    this.cuisineType,
    this.ingredientLines,
  }) : super(key: key);

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset('asset/images/background_design.svg'),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        'asset/images/app_icon.png',
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: SearchBar(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsetsDirectional.only(start: 10, end: 0.0),
                        ),
                        hintStyle: MaterialStatePropertyAll(
                          TextStyle(color: Colors.grey.shade600),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        leading: const Icon(Icons.search),
                        hintText: 'Search...',
                        controller: _controller,
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
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const RefineSearchText(
                  firstString: 'REFINE SEARCH BY',
                  secondString: 'Calories, Diet, Ingredients',
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(24).copyWith(top: 0, bottom: 0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.label,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: AppColors.kBoldTextColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      "See full recipe on: ${widget.source}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: AppColors.kBoldTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        RoundedButton(
                                          imageLink: 'asset/images/add.svg',
                                          onTapEvent: () {},
                                        ),
                                        const SizedBox(width: 10),
                                        RoundedButton(
                                          imageLink: 'asset/images/share.svg',
                                          onTapEvent: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  widget.imageLink,
                                  height: 168,
                                  width: 168,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const LightLabel(label: 'Health Labels:'),
                          const SizedBox(height: 5.0),
                          HealthNCuisineCard(label: widget.healthLabel),
                          const SizedBox(height: 15),
                          //
                          const LightLabel(label: 'Cuisine Type:'),
                          const SizedBox(height: 5.0),
                          HealthNCuisineCard(label: widget.cuisineType),
                          const SizedBox(height: 20),
                          //
                          const DeepLabel(label: 'Ingredients'),
                          SizedBox(
                            height: 120,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.ingredientLines!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(width: 10);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                final split =
                                    widget.ingredientLines![index].split(' ');
                                if (split.length == 2) {
                                  return IngredientCard(
                                    title: split[0],
                                    subtitle: split[1],
                                  );
                                } else if (split.length == 3) {
                                  return IngredientCard(
                                    title: split[0],
                                    subtitle: '${split[1]}\n${split[2]}',
                                  );
                                } else {
                                  return IngredientCard(
                                    title: split[0],
                                    subtitle: '${split[1]}\n${split[2]}',
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          const DeepLabel(label: 'Preparation'),
                          const SizedBox(height: 5.0),
                          const RefineSearchText(
                            firstString: 'Instructions on',
                            secondString: 'BBC Food',
                          ),
                          const SizedBox(height: 20),
                          const DeepLabel(label: 'Nutrition'),
                          const SizedBox(height: 5.0),
                          const NutritionCard1(),
                          //
                          const SizedBox(height: 20),
                          const DeepLabel(label: 'Tags'),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Low-Carb, Dairy-Free, Egg-Free, Peanut-Free, Tree-Nut-Free, Soy-Free, Fish-Free',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.kDeepGrey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          //
                          const SizedBox(height: 20),
                          const DeepLabel(label: 'Nutrition'),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Material(
                              elevation: 4.0,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: StadiumBorder(),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Fat',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.kBoldTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Carbs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.kDeepGrey,
                                      ),
                                    ),
                                    Text(
                                      'Protein',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.kDeepGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const NutritionCard2(
                            title: 'Fat',
                          ),
                          //
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
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
