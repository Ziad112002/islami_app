import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/screens/main/tabs/ahadith/hadith_dm.dart';
import 'package:islami/ui/utils/app_assets.dart';

import 'hadith_item.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithDm> hadith = [];
  @override
  void initState() {
    super.initState();
    loadHadithText();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset(AppAssets.islamiImg),
          Expanded(child: buildHadithSlider()),
        ],
      ),
    );
  }

  Widget buildHadithSlider() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: false,
        height: double.infinity,
        enlargeCenterPage: true,
        enableInfiniteScroll: false
      ),
      itemCount: hadith.length,
      itemBuilder: (context, index, _) => HadithItem(hadith: hadith[index]),
    );
  }

  void loadHadithText() async {
    String fileContent = await rootBundle.loadString(
      "assets/files/ahadeth.txt",
    );
    List<String> hadithList = fileContent.trim().split("#");
    for (int i = 0; i < hadithList.length; i++) {
      String oneHadith = hadithList[i].trim();
      List<String> lines = oneHadith.split("\n");
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join();
      hadith.add(
        HadithDm(hadithTitle: title, hadithContent: content, index: i + 1),
      );
    }
    setState(() {});
  }
}
