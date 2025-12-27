import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/main.dart';
import 'package:islami/ui/screens/splash/onboarding.dart';
import 'package:islami/ui/screens/splash/splash.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    routes: {
      Splash.routeName:(context)=>Splash(),
      Main.routeName:(context)=>Main(),
      SuraDetails.routeName:(context)=>SuraDetails(),
      Onboarding.routeName:(context)=>Onboarding(),
    },
    initialRoute: Splash.routeName,
    );
  }
}


