import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/main.dart';
import 'package:islami/ui/screens/splash/splash.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    routes: {
      Splash.routeName:(context)=>Splash(),
      Main.routeName:(context)=>Main()
    },
    initialRoute: Splash.routeName,
    );
  }
}


