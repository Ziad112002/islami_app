import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/tabs/ahadith/hadith_dm.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class HadithDetails extends StatefulWidget {
  static const String routeName = "hadith_details";
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  late HadithDm hadith;
  @override
  Widget build(BuildContext context) {
    hadith = ModalRoute.of(context)!.settings.arguments as HadithDm;
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
        title: Text("Hadith ${hadith.index}", style: AppTextStyles.goldBold20),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.gold),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0,right: 10,left: 10),
            child: buildHadithHeader(),
          ),
          Expanded(child: SingleChildScrollView(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(hadith.hadithContent,textDirection: TextDirection.rtl,textAlign: TextAlign.center, style: AppTextStyles.goldBold20),
          ))),
          Image.asset(AppAssets.mosque)
        ],
      ),
    );
  }

  Row buildHadithHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppAssets.imgLeftCorner),
        Text(hadith.hadithTitle, style: AppTextStyles.goldBold24),
        Image.asset(AppAssets.imgRightCorner),
      ],
    );
  }

}