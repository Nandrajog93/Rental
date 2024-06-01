import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}



 // Widget buildSearchBar(BuildContext context) {
    //   return ResponsiveBuilder(
    //     builder: (context, sizingInformation) {
    //       double width;

    //       if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
    //         width = MediaQuery.of(context).size.width * 0.8;
    //       } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
    //         width = MediaQuery.of(context).size.width * 0.6;
    //       } else {
    //         width = MediaQuery.of(context).size.width * 0.4;
    //       }

    //       return Container(
    //         width: width,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(30),
    //           color: Colors.grey[200],
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //           child: TextField(
    //             decoration: InputDecoration(
    //               hintText: 'Search...',
    //               border: InputBorder.none,
    //               prefixIcon: Icon(Icons.search, color: Colors.grey),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }

      //   Widget buildCustomAppBar(BuildContext context) {
      //     return ClipRRect(
      //       borderRadius: BorderRadius.circular(30.0), // Full rounded edges
      //       child:AppBar(
      //         // title: const Text("GeeksforGeeks"),
      //         centerTitle: true,
      //         toolbarHeight: 60.2,
      //         toolbarOpacity: 0.8,
      //         elevation: 0.0,
      //         backgroundColor: Colors.lightBlue[100],
      //       ),
      //     );
      //   }
      // }