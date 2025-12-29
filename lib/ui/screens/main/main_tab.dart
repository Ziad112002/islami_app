
import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/tabs/ahadith/hadith_tab.dart';
import 'package:islami/ui/screens/main/tabs/quran/quran_tab.dart';
import 'package:islami/ui/screens/main/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/utils/app_colors.dart';

import '../../utils/app_assets.dart';

class MainTab extends StatefulWidget {
  static const String routeName = "main";
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int selectedIndex = 0;
  List tabs=[
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    Container(color: Colors.cyanAccent,),
    Container(color: Colors.pink,),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
        bottomNavigationBar: buildBottomNavigationBar());
  }

  Widget buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.gold),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.lightBlack,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: [
          buildBottomNavigationBarItem(
            AppAssets.icQuran,
            "Quran",
            selectedIndex == 0,
          ),
          buildBottomNavigationBarItem(
            AppAssets.icHadith,
            "Hadith",
            selectedIndex == 1,
          ),
          buildBottomNavigationBarItem(
            AppAssets.icSebha,
            "Sebha",
            selectedIndex == 2,
          ),
          buildBottomNavigationBarItem(
            AppAssets.icRadio,
            "Radio",
            selectedIndex == 3,
          ),
          buildBottomNavigationBarItem(
            AppAssets.icTime,
            "Time",
            selectedIndex == 4,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
    String imagePath,
    String title,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.5, vertical: 6),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: isSelected
              ? AppColors.lightBlack.withAlpha(153)
              : Colors.transparent,
        ),
        child: ImageIcon(AssetImage(imagePath)),
      ),
      label: title,
    );
  }
}
