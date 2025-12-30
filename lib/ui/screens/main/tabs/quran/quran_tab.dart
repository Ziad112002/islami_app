import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami/ui/screens/main/tabs/quran/sura_item.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_text_style.dart';
import 'package:islami/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/app_colors.dart';
import '../../../sura_details/sura_details.dart';
import 'most_recent_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraDm> filteredSurasList = surasList;
  List mostRecentSuraList = [];
  @override
  void initState() {
    super.initState();
    loadSurasFromSharedPrefs();
  }

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppAssets.islamiImg),
            SizedBox(height: 16),
            buildSurNameTextField(),
            SizedBox(height: 16),
            if (mostRecentSuraList.isNotEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height*.2,
                  child: buildMostRecently()),
            SizedBox(height: 16),
        
            buildSuraListView(),
          ],
        ),
      ),
    );
  }

  Widget buildSurNameTextField() {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1, color: AppColors.gold),
    );
    return TextField(
      onChanged: (text) {
        if (text.trim().isEmpty) {
          filteredSurasList = surasList;
        } else {
          filteredSurasList = surasList.where((sura) {
            return sura.suraNameEn.toLowerCase().contains(text.toLowerCase()) ||
                sura.suraNameAr.toLowerCase().contains(text.toLowerCase());
          }).toList();
          setState(() {

          });
        }
      },
      style: AppTextStyles.whiteBold16,
      cursorColor: AppColors.gold,
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

  Widget buildMostRecently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently", style: AppTextStyles.whiteBold16),
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mostRecentSuraList.length,
            itemBuilder: (context, index) =>
                MostRecentItem(sura: mostRecentSuraList[index]),
          ),
        ),
      ],
    );
  }

  Widget buildSuraListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Suras List", style: AppTextStyles.whiteBold16),
        SizedBox(height: 5),
        ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: filteredSurasList.length,
          shrinkWrap: true,
          physics:NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () async {
              saveSurasToSharedPrefs(filteredSurasList[index]);
              await Navigator.pushNamed(
                context,
                SuraDetails.routeName,
                arguments: filteredSurasList[index],
              );
              loadSurasFromSharedPrefs();
            },
            child: SuraItem(sura: filteredSurasList[index]),
          ),
          separatorBuilder: (_, _) => Divider(endIndent: 23, indent: 23),
        ),
      ],
    );
  }

  void saveSurasToSharedPrefs(SuraDm sura) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> oldSavedSuras = prefs.getStringList("most_recent_sura") ?? [];
    oldSavedSuras.insert(0, "${sura.suraIndex}");
    prefs.setStringList("most_recent_sura", oldSavedSuras.toSet().toList());
  }

  void loadSurasFromSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? surasIndexList = prefs.getStringList("most_recent_sura");
    if (surasIndexList == null) return;
    mostRecentSuraList = surasIndexList.map((suraIndex) {
      int index = int.parse(suraIndex);
      return surasList[index - 1];
    }).toList();
    setState(() {});
  }
}
