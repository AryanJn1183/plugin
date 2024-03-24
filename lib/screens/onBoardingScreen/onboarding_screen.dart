import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plugin/screens/map_screen.dart';
import 'package:plugin/screens/onBoardingScreen/onboarding_page.dart';
import 'package:plugin/screens/pre_vehicle.dart';
import 'package:plugin/screens/signup.dart';


class OnBoardingScreen extends StatefulWidget
{
 const OnBoardingScreen({super.key});
 @override
  State<OnBoardingScreen> createState() {
    return _OnBoardingScreenState();
  }

}

class _OnBoardingScreenState extends State<OnBoardingScreen>
{
  final PageController _pageController = PageController(initialPage: 0);
  double currentPageValue = 0;
  double vehiclePosition = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 843),
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPageValue = page.toDouble();
                  vehiclePosition = currentPageValue * MediaQuery.of(context).size.width;
                });
              },
              children: [
                OnboardingPage(
                  imagePath2: 'assets/images/bg_1.png',
                  imagePath: 'assets/images/car.png',
                  imagePath3: 'assets/images/charger.png',
                  que: 'Searching EV Station??',
                  soln: "We will locate you with all the available station on your way!!!",
                  nextButtonLabel: "Next",
                  onNextButtonPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  currentPageValue: currentPageValue,
                  top2: 150,
                  left2: 0,
                  top: -100,
                  left: -2,
                  top3: 229,
                  left3: 19,
                ),
                OnboardingPage(
                  imagePath2: 'assets/images/bg_1.png',
                  imagePath: 'assets/images/car.png',
                  imagePath3: 'assets/images/charger.png',
                  que: 'Assured by the user...',
                  soln: "Get customer ratings, prices, and compatible chargers in one app.",
                  nextButtonLabel: "Next",
                  onNextButtonPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  backButtonLabel: "Back",
                  onBackButtonPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                  },
                  currentPageValue: currentPageValue,
                  top2: 150,
                  left2: 0,
                  top: -100,
                  left: -2,
                  top3: 229,
                  left3: 19,
                ),
                OnboardingPage(
                  imagePath2: 'assets/images/bg_1.png',
                  imagePath: 'assets/images/car.png',
                  imagePath3: 'assets/images/charger.png',
                  que: 'Plan Your EV Journey!!',
                  soln: "With trust, plan your upcoming travel. Locate charging locations along the way.",
                  backButtonLabel: "Back",
                  onBackButtonPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                  },
                  nextButtonLabel: "Get Started",
                  onNextButtonPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PreVehicle()),
                    );
                  },
                  currentPageValue: currentPageValue,
                  top2: 150,
                  left2: 0,
                  top: -100,
                  left: -2,
                  top3: 229,
                  left3: 19,
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}