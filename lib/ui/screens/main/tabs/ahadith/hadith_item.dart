import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/tabs/ahadith/hadith_dm.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_style.dart';
import '../../../hadith_details/hadith_details.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.hadith});

  final HadithDm hadith;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadithDetails.routeName,arguments: hadith);
      },
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 12),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(AppAssets.hadithCardBg)),
          color: AppColors.gold,
        ),
        child: Stack(
          children: [
            buildHadithArHeader(),

            Column(
              children: [
                SizedBox(height:30),
                Text(hadith.hadithTitle,textAlign: TextAlign.center, style: AppTextStyles.lightBlackBold24),
                SizedBox(height:15),
                buildHadithText(),
                Image.asset(AppAssets.mosque),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildHadithArHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppAssets.imgLeftCorner, color: AppColors.lightBlack),

        Image.asset(AppAssets.imgRightCorner, color: AppColors.lightBlack),
      ],
    );
  }

  Widget buildHadithText() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          hadith.hadithContent,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: AppTextStyles.lightBlackBold16,
        ),
      ),
    );
  }
}
