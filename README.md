<img src="screenshots/badges/built-with-love.svg" height="28px"/>&nbsp;&nbsp;
<img src="screenshots/badges/flutter-dart.svg" height="28px" />&nbsp;&nbsp;
<a href="https://choosealicense.com/licenses/mit/" target="_blank"><img src="screenshots/badges/license-MIT.svg" height="28px" /></a>&nbsp;&nbsp;
<img src="screenshots/badges/Flutter-3.svg" height="28px" />&nbsp;&nbsp;
<img src="screenshots/badges/dart-null_safety-blue.svg" height="28px"/>

# Recipe

<img align="right" src="screenshots/app_icon/playstore.png" height="190"></img>
This application is a Pre-assessment for the Flutter Developer position. It's an open-source project, hence use of the source code is governed by an MIT-style license that can be found in the LICENSE file or at <a href = "https://choosealicense.com/licenses/mit/">MIT LICENSE Info.</a>

## Packages Used

This application is using one third-party package from the open-source community. Thanks to the developers of <a href = "https://pub.dev/packages/graphql_flutter">graphql_flutter: ^5.1.2 </a> for this amazing package. The purpose of using this package is to run GraphQL quartes in a flutter application.

```yaml
  graphql_flutter: ^5.1.2   //For using graphQL API
```

<p align="center">
    <a href="https://drive.google.com/file/d/1H71hQf91-4drG2sCt4YHXswn_lE6CRvd/view?usp=sharing" target="_blank"><img src="screenshots/download_apk/download.png" height="100" ></img></a>
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
├── widgets/
│   ├── deep_label.dart
│   ├── empty_search.dart
│   ├── health_n_cuisine_card.dart
│   ├── ingredient_card.dart
│   ├── light_label.dart
│   ├── nutrition_card_1.dart
│   ├── nutrition_card_2.dart
│   ├── recipe_card.dart
│   ├── refine_search_text.dart
│   └── rounded_button.dart
└── main.dart
```