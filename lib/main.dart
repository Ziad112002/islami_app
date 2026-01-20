import 'package:flutter/material.dart';
import 'package:islami/ui/screens/hadith_details/hadith_details.dart';
import 'package:islami/ui/screens/main/main_tab.dart';
import 'package:islami/ui/screens/splash/onboarding.dart';
import 'package:islami/ui/screens/splash/splash.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:islami/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool? showOnboarding;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  showOnboarding = prefs.getBool(AppConstants.displayOnboarding) ?? true;
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
      MainTab.routeName:(context)=>MainTab(),
      SuraDetails.routeName:(context)=>SuraDetails(),
      Onboarding.routeName:(context)=>Onboarding(),
      HadithDetails.routeName:(context)=>HadithDetails(),
    },
    initialRoute:showOnboarding!? Onboarding.routeName:MainTab.routeName,
    );
  }
}


