import 'package:flutter/material.dart';
import 'package:test_application/src/homepage.dart';
import 'package:test_application/src/settings/Tabview.dart';
import 'package:test_application/src/settings/login.dart';
import 'package:test_application/src/settings/signup.dart';
//import 'package:test_application/src/calculation.dart';
//import 'package:flutter_application_1/src/maps.dart';
//import 'package:flutter_application_1/src/settings/test.dart';
// import 'package:test_application/src/homepage.dart';
// import 'package:test_application/src/search.dart';
// import 'package:test_application/src/settings/searchBar.dart';
//import 'package:test_application/test.dart';

// import 'shared/navigation/app_router.dart';
import '/src/color.dart';

void main() {

  runApp(
    
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
       //colorScheme: Colors.white,

      ),
      home:  SignupDesktop(),
    );
  }
}
