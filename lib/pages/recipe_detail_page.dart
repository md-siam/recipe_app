import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/app_color.dart';

import '../widgets/rounded_button.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);

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
                                    const Text(
                                      "Wok-Fried Duck & Oyster Sauce",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.kBoldTextColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    const Text(
                                      "See full recipe on: BBC Good Food",
                                      style: TextStyle(
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
                                  'https://hot-thai-kitchen.com/wp-content/uploads/2022/05/cashew-chicken-sq.jpg',
                                  height: 168,
                                  width: 168,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Health Labels:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 165, 166, 168),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Cuisine Type:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 165, 166, 168),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Ingredients',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kBoldTextColor,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  AppColors.kBoldTextUnderLineColor,
                              decorationThickness: 3,
                            ),
                          ),
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
