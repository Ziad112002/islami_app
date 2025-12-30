import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/tabs/quran/sura_dm.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_style.dart';
class MostRecentItem extends StatelessWidget {
  const MostRecentItem({
    super.key,
    required this.sura,
  });

  final SuraDm sura;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: MediaQuery.of(context).size.height*.16,
      width: MediaQuery.of(context).size.width*.6,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(sura.suraNameEn,style: AppTextStyles.lightBlackBold14,),
              Text(sura.suraNameAr,style: AppTextStyles.lightBlackBold14,),
              Text("${sura.suraVerses} Verses  ",style: AppTextStyles.lightBlackBold14,),

            ],
          ),
          Image.asset(AppAssets.imgMostRecent)
        ],
      ),
    );
  }
}
