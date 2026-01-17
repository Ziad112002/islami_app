import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_text_style.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  List<String> azkar = [
    "سُبْحَانَ اللَّهِ",
    "الْحَمْدُ لِلَّهِ",
    "لا إِلَهَ إِلا اللَّهُ",
    "اللَّهُ أَكْبَرُ",
  ];
  int index = 0;
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebhaBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.islamiImg),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.whiteBold36,
            ),
            SizedBox(height: 16),
            Expanded(child: buildSebha()),
          ],
        ),
      ),
    );
  }

  Widget buildSebha() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(top: 1.5, left: 2.5),
          child: Align(
            alignment: AlignmentGeometry.topCenter,
            child: Image.asset(AppAssets.sebhaHeader),
          ),
        ),

        Align(
          alignment: AlignmentGeometry.center,
          child: GestureDetector(
            onTap: () {
              setState(() {
                count++;
                turns += 1.0 / 33;
                if (count == 33 && index < 3) {
                  index++;
                  count = 0;
                }
                if (index == 3 && count == 33) {
                  index = 0;
                  count = 0;
                }
              });
            },
            child: AnimatedRotation(
              turns: turns,
              duration: Duration(milliseconds: 200),
              child: Image.asset(AppAssets.sebhaBody),
            ),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.center,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(azkar[index], style: AppTextStyles.whiteBold36),
              Text("$count", style: AppTextStyles.whiteBold36),
            ],
          ),
        ),
      ],
    );
  }
}
