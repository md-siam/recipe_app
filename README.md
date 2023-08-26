<img src="screenshots/badges/built-with-love.svg" height="28px"/>&nbsp;&nbsp;
<img src="screenshots/badges/flutter-dart.svg" height="28px" />&nbsp;&nbsp;
<a href="https://choosealicense.com/licenses/mit/" target="_blank"><img src="screenshots/badges/license-MIT.svg" height="28px" /></a>&nbsp;&nbsp;
<img src="screenshots/badges/Flutter-3.svg" height="28px" />&nbsp;&nbsp;
<img src="screenshots/badges/dart-null_safety-blue.svg" height="28px"/>

# Recipe

<img align="right" src="screenshots/app_icon/playstore.png" height="190"></img>
This application is a Pre-assessment for the Mid-Level Flutter Developer position at [Battery Low Interactive Ltd.](https://batterylowinteractive.com/). You can read the details of the Pre-assessment from the pdf file [here](screenshots/pdf/Online*Assessment*(Flutter_Developer).pdf).<br /> It's an open-source project, hence use of the source code is governed by an MIT-style license that can be found in the LICENSE file or at [MIT LICENSE Info](https://choosealicense.com/licenses/mit/). This app is using a RESTful API from: [https://rapidapi.com/edamam/api/recipe-search-and-diet](https://rapidapi.com/edamam/api/recipe-search-and-diet).

## Packages Used

This React Conf application is using some third-party packages from the open-source community. Thanks to the developers for these amazing packages. Those third-party packages are:

```yaml
# For rendering svg files
flutter_svg: ^2.0.7
# For accessing .env files
flutter_dotenv: ^5.1.0
# For http calls
dio: ^5.3.2
# For state management
provider: ^6.0.5
# For image placeholder
cached_network_image: ^3.2.3
# For tab bar
buttons_tabbar: ^1.3.7+1
```

<p align="center">
    <a href="https://drive.google.com/file/d/1MiFqfIQ359jej_ai7jE9HYyPC43yd1eb/view?usp=sharing" target="_blank"><img src="screenshots/download_apk/download.png" height="100" ></img></a>
  </p>

## App Demo

<p align="center"><img src="screenshots/gif/app_demo.gif"></p>

## File Pattern Inside The `lib` Folder

```
lib/
├── core/
│   ├── app_color.dart
│   └── sample_data.json
├── models/
│   └── recipe_model.dart
├── pages/
│   ├── recipe_detail_page.dart
│   └── recipe_page.dart
├── services/
│   └── get_recipe_data.dart
├── view_models/
│   └── recipe_info_provider.dart
├── widgets/
│   ├── deep_label.dart
│   ├── empty_search.dart
│   ├── error_search.dart
│   ├── health_n_cuisine_card.dart
│   ├── ingredient_card.dart
│   ├── light_label.dart
│   ├── nutrition_card_1.dart
│   ├── nutrition_card_2.dart
│   ├── recipe_card.dart
│   ├── refine_search_text.dart
│   ├── rounded_button.dart
│   └── tab_widget.dart
└── main.dart
```
