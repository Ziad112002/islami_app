import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami/ui/screens/main/tabs/quran/sura_item.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_text_style.dart';
import 'package:islami/ui/utils/constants.dart';
import '../../../../utils/app_colors.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraDm>suraHistorySearch=surasList;
  SuraDm? sura;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranTabBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Image.asset(AppAssets.islamiImg),
          SizedBox(height: 16),
          buildSurNameTextField(),
          SizedBox(height: 16),
          // Expanded(child: buildMostRecently()),
          SizedBox(height: 16),

          Expanded(flex: 2,
              child: buildSuraListView()),
        ],
      ),
    );
  }

  Widget buildSurNameTextField() {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1, color: AppColors.gold),
    );
    return TextField(
      onChanged: (text){
        if(text.trim().isEmpty){
           suraHistorySearch=surasList;
        }
        suraHistorySearch=surasList.where((sura){
          return sura.suraNameEn.toLowerCase().contains(text.toLowerCase())||
              sura.suraNameAr.contains(text);

        }).toList();
        setState(() {

        });
      },
      style: AppTextStyles.whiteBold16,
      cursorColor:AppColors.gold ,
      decoration: InputDecoration(
        label: Text("Sura Name"),
        labelStyle: AppTextStyles.whiteBold16,
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.icQuran),
          color: AppColors.gold,
        ),
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget buildMostRecently(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently",style: AppTextStyles.whiteBold16,),
        SizedBox(height: 16,),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
              itemBuilder: (context,index)=> buildMostRecentSurItem(context)
          ),
        )
      ],
    );
  }

  Widget buildMostRecentSurItem(BuildContext context){
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
              Text("Al-Anbiya",style: AppTextStyles.lightBlackBold14,),
              Text("الأنبياء",style: AppTextStyles.lightBlackBold14,),
              Text("112 Verses  ",style: AppTextStyles.lightBlackBold14,),

            ],
          ),
          Image.asset(AppAssets.imgMostRecent)
        ],
      ),
    );
  }

  Widget buildSuraListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Suras List", style: AppTextStyles.whiteBold16),
        SizedBox(height: 5),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: suraHistorySearch.length,
            itemBuilder: (context, index) => SuraItem(sura: suraHistorySearch[index],),
            separatorBuilder: (_, _) => Divider(endIndent: 23,indent: 23),
          ),
        ),
      ],
    );
  }
}

