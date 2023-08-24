import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'core/app_color.dart';
import 'pages/recipe_page.dart';
import 'view_models/recipe_info_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  // For disabling landscape view
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeInfoProvider()),
      ],
      child: MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'Poppins',
          splashColor: AppColors.kGreen.withOpacity(0.20),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kGreen),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.kGreen,
          ),
        ),
        home: const RecipePage(),
      ),
    );
  }
}
