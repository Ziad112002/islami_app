import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_text_style.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "sura_details";
  SuraDetails({super.key});
  late SuraDm sura;

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDm;
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
        title: Text(sura.suraNameEn, style: AppTextStyles.goldBold20),
        centerTitle: true,
        iconTheme:  IconThemeData(
          color: AppColors.gold,

        ),
        backgroundColor: AppColors.lightBlack,
      ),
      body: Column(
        children: [
          buildSuraArHeader()
        ],
      ),
    );
  }

  Row buildSuraArHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppAssets.imgLeftCorner,),
            Text(sura.suraNameAr,style: AppTextStyles.goldBold24,),
            Image.asset(AppAssets.imgRightCorner,),
          ],
        );
  }
}
