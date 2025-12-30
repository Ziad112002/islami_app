import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key,required this.sura});
final SuraDm sura;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.surNum)),
          ),
          child: Text("${sura.suraIndex}", style: AppTextStyles.whiteBold16),
        ),

        SizedBox(width: 25),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sura.suraNameEn, style: AppTextStyles.whiteBold20),
              Text("${sura.suraVerses} Verses  ", style: AppTextStyles.whiteBold14),
            ],
          ),
        ),
        Text(sura.suraNameAr, style: AppTextStyles.whiteBold20),
      ],
    );
  }
}
