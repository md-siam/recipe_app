import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_color.dart';

import '../widgets/empty_search.dart';
import '../widgets/recipe_card.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final TextEditingController _controller = TextEditingController();
  bool displayEmptyPage = true;

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
      body: displayEmptyPage
          ? const EmptySearch()
          : Padding(
              padding: const EdgeInsets.all(8).copyWith(top: 15, bottom: 0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GridView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .87,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return const RecipeCard();
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
    );
  }
}
