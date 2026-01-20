import 'package:flutter/material.dart';
import 'package:islami/ui/models/onboarding_model.dart';
import 'package:islami/ui/screens/main/main_tab.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_text_style.dart';
import 'package:islami/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  List<OnboardingModel> onboardingData = [
    OnboardingModel(
      imagePath: AppAssets.welcomeAr,
      label: "Welcome To Islami App",
      description: "",
    ),
    OnboardingModel(
      imagePath: AppAssets.kaaba,
      label: "Welcome To Islami App",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      imagePath: AppAssets.welcomeImg,
      label: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      imagePath: AppAssets.bearish,
      label: "Bearish",
      description: "Praise the name of your Lord, the Most\n High",
    ),
    OnboardingModel(
      imagePath: AppAssets.radio,
      label: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.islamiImg),
            Expanded(
              child: PageView.builder(
                onPageChanged: _onPagedChanged,
                controller: _pageController,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return buildAppWelcome(onboardingData[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _currentIndex == 0 ? false : true,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: TextButton(
                    onPressed: _previousPage,
                    child: Text("Back", style: AppTextStyles.goldBold16),
                  ),
                ),
                buildSmoothPageIndicator(),
                TextButton(
                  onPressed: _currentIndex != 4
                      ? _nextPage
                      : () async {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          await prefs.setBool(AppConstants.displayOnboarding, false);
                          Navigator.pushNamed(context, MainTab.routeName);
                        },
                  child: Text(
                    _currentIndex != 4 ? "Next" : "Finish",
                    style: AppTextStyles.goldBold16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppWelcome(OnboardingModel data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(data.imagePath),

        Text(data.label, style: AppTextStyles.goldBold24),

        Text(
          data.description,
          style: AppTextStyles.goldBold20,
          textAlign: TextAlign.center,
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
    _pageController.nextPage(
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
