# Roll & Dice Game
- This is Roll And Dice game build using flutter and firebase cloud store using MVVM structure.
- The game have 10 attempts that user can play .
- The game also showing users score and attempts consumed by users.
- The game is also showing leader board based on scored by user after 10 attempts of user .

## Getting Started
*Step 1*
Download or clone this repo by using the link below and switch to *master* branch:
sh
https://github.com/SameerDonga/RollAndDice.git

*Step 2*
Go to project root and execute the following command in console to get the required dependencies:
sh
flutter pub get

*Congratulation ! Now You can build the application*

## Project Features
- Splash
- Login
- Signup
- Home
- Leaderboard
- Routing
- Firebase Auth
- Firebase Firestore
- RealTime & Offline Syncing
- Provider (State Management)
- Validation
- Code Generation
- Logging
## Libraries & Tools Used
- [GetIt] - HTML enhanced for web apps!
- This is a simple Service Locator for Dart and Flutter projects with some additional goodies highly inspired by Splat. It can be used instead of InheritedWidget or Provider to access objects e.g. from your UI.
- [provider_architecture] -
- The ViewModelProvider is used to create the "binding" between a ViewModel and the View. There is no two-way binding in this architecture, which is why I don't want to say it's an Mvvm implementation. The ViewModelProvider wraps up all the ChangeNotifierProvider code which allows us to trigger a rebuild of a widget when calling notifyListeners within the ViewModel.
- [intl] -
- This package provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
- [page_transition] -
- This package provides beautiful page transaition effects.
- [fimber] -
- This package is based on famous Android logging library API called Timber.this is library for simplify logging for Flutter. Using similar (as far as Dart lang allows) method API with same concepts for tree and planting logging tree.
- [flushbar] -
- This package allows more customization when notifying your users by snackbars.
- [shared_preferences] -
- Wraps platform-specific persistent storage for simple data (NSUserDefaults on iOS and macOS, SharedPreferences on Android, etc.). Data may store to the disk asynchronously.
- [package_info] -
- This package which provides an API for querying information about an application package.
- [connectivity] -
- This plugin allows apps to discover network connectivity and configure themselves accordingly. It can distinguish between cellular vs WiFi connection.
- [firebase_auth] -
- The official firebase_auth package is providing firebase oAuth APIs(phone,email,google login etc.) and use of that using classes made by Firebase.
- [cloud_firestore] -
- The official cloud_firestore package is providing firebase firestore APIs using it's own method & classes we can manage the database of firestore

[intl]: <https://pub.dev/packages/intl>
[provider_architecture]: <https://pub.dev/packages/provider_architecture>
[page_transition]: <https://pub.dev/packages/page_transition>
[fimber]: <https://pub.dev/packages/fimber>
[flushbar]: <https://pub.dev/packages/flushbar>
[shared_preferences]: <https://pub.dev/packages/shared_preferences>
[package_info]: <https://pub.dev/packages/package_info>
[connectivity]: <https://pub.dev/packages/connectivity>
[firebase_auth]: <https://pub.dev/packages/firebase_auth>
[cloud_firestore]: <https://pub.dev/packages/cloud_firestore>
[GetIt]: <https://pub.dev/packages/get_it>