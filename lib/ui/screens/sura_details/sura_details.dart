import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_text_style.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDm sura;

  String suraContent = "";
  @override
  void initState() {
    super.initState();
    // this code will be executed once after build function
    WidgetsBinding.instance.addPostFrameCallback((_) {
      readFile();
    });

  }

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDm;
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
        title: Text(sura.suraNameEn, style: AppTextStyles.goldBold20),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.gold),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0,right: 10,left: 10),
            child: buildSuraArHeader(),
          ),
          Expanded(child: SingleChildScrollView(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(suraContent,textDirection: TextDirection.rtl,textAlign: TextAlign.center, style: AppTextStyles.goldBold20),
          ))),
          Image.asset(AppAssets.mosque)
        ],
      ),
    );
  }

  Row buildSuraArHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppAssets.imgLeftCorner),
        Text(sura.suraNameAr, style: AppTextStyles.goldBold24),
        Image.asset(AppAssets.imgRightCorner),
      ],
    );
  }

  Future readFile() async {
    var fileName = "assets/files/suras/${sura.suraIndex}.txt";
    suraContent = await rootBundle.loadString(fileName);
    suraContent=suraContent.trim();
    List<String> suraLines=suraContent.split("\n");
    for(int i=0;i<suraLines.length;i++){
      suraLines[i]+="[${i+1}]";
    }
    suraContent=suraLines.join();
    setState(() {});
  }
}
