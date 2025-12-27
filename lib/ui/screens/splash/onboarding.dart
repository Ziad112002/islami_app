import 'package:flutter/material.dart';
import 'package:islami/ui/screens/main/main.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_text_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = "on_boarding";
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiImg),
          SizedBox(height: 60),
          Expanded(
            child: PageView(
              onPageChanged: _onPagedChanged,
              controller: _pageController,
              children: [
                buildAppWelcome(
                  AppAssets.welcomeAr,
                  "Welcome To Islami App",
                  null,
                ),
                buildAppWelcome(
                  AppAssets.kaaba,
                  "Welcome To Islami App",
                  "We Are Very Excited To Have You In Our Community",
                ),
                buildAppWelcome(
                  AppAssets.welcomeImg,
                  "Reading the Quran",
                  "Read, and your Lord is the Most Generous",
                ),
                buildAppWelcome(
                  AppAssets.bearish,
                  "Bearish",
                  "Praise the name of your Lord, the Most\n High",
                ),
                buildAppWelcome(
                  AppAssets.radio,
                  "Holy Quran Radio",
                  "You can listen to the Holy Quran Radio through the application for free and easily",
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Visibility(
                  visible: _currentIndex==0?false:true,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: TextButton(
                    onPressed: _previousPage,
                    child: Text("Back", style: AppTextStyles.goldBold16),
                  ),
                ),
              buildSmoothPageIndicator(),
              _currentIndex != 4
                  ? TextButton(
                      onPressed: _nextPage,
                      child: Text("Next", style: AppTextStyles.goldBold16),
                    )
                  : TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Main.routeName);
                      },
                      child: Text("Finish", style: AppTextStyles.goldBold16),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAppWelcome(String imagePath, String text, String? subText) {
    return subText == null
        ? Column(
            children: [
              Image.asset(imagePath),
              SizedBox(height: 69),
              Text(text, style: AppTextStyles.goldBold24),
            ],
          )
        : Column(
            children: [
              Image.asset(imagePath),
              SizedBox(height: 40),
              Text(text, style: AppTextStyles.goldBold24),
              SizedBox(height: 40),
              Text(
                subText,
                textAlign: TextAlign.center,
                style: AppTextStyles.goldBold20,
              ),
            ],
          );
  }

  Widget buildSmoothPageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 5,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.gold,
        dotColor: AppColors.grey,
        dotHeight: 10,
        dotWidth: 10,
      ),
    );
  }

  void _onPagedChanged(int index) {
    _currentIndex = index;
    setState(() {});
  }

  void _nextPage() {
    if (_currentIndex < 4) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }
}
