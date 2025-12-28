import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_text_style.dart';

class SebhaTab extends StatefulWidget {
   const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
int count=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 35),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebhaBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Image.asset(AppAssets.islamiImg),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            textDirection: TextDirection.rtl,
            style: AppTextStyles.whiteBold36,
          ),
          buildSebha(),
        ],
      ),
    );
  }

  Widget buildSebha() {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        InkWell(onTap: (){
          count++;
          setState(() {

          });

        },
            child: Image.asset(AppAssets.bigSebha)
        ),
        Text("سبحان الله", style: AppTextStyles.whiteBold36),
        Positioned(
          bottom: 140,
          child: Text("$count", style: AppTextStyles.whiteBold36),
        ),
      ],
    );
  }
}
