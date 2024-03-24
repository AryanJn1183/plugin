import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatefulWidget{
  final double top;
  final double left;
  final double top2;
  final double left2;
  final String que;
  final String soln;
  final String nextButtonLabel;
  final String? backButtonLabel;
  final VoidCallback onNextButtonPressed;
  final VoidCallback? onBackButtonPressed;
  final String imagePath;
  final String imagePath2;
  final String imagePath3;
  final double? top3;
  final double? left3;
  final double currentPageValue;
  const OnboardingPage({
    super.key,
    required this.currentPageValue,
    required this.imagePath,
    required this.imagePath2,
    required this.imagePath3,
    required this.top,
    required this.top2,
    this.top3,
    required this.left,
    required this.left2,
    this.left3,
    required this.que,
    required this.soln,
    required this.nextButtonLabel,
    this.onBackButtonPressed,
    this.backButtonLabel,
    required this.onNextButtonPressed,
    });

    @override
  State<StatefulWidget> createState() {
    return _OnboardingPageState();
  }
}
class _OnboardingPageState extends State<OnboardingPage> with SingleTickerProviderStateMixin
{
  late AnimationController animationController;
  late Animation<Offset> offsetAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animationController.addListener(() {
      setState(() {});
    });

    offsetAnimation = Tween<Offset>(
      begin: const Offset(-350, 180),
      end: const Offset(-2, 180),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.1, 0.3, curve: Curves.easeInOut),
    ));
    animationController.forward();
    @override
    void dispose() {
      animationController.dispose();
      super.dispose();
    }

  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390,843),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
         Positioned(
            top: widget.top2,
            left: widget.left2,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(widget.imagePath2,height: 300.h,width: 400.w,),
            ),
          ),
          Positioned(
            top: widget.top3,
            left: widget.left3,
            child: Align
            (
              alignment: Alignment.topCenter,
              child: Image.asset(widget.imagePath3,height: 200.h,width: 84.w,),
            ),
          ),
          Positioned(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => Transform.translate(
                offset: offsetAnimation.value,
                child: child,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(widget.imagePath),
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 27,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                widget.que,
                style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 27,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.soln,
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 150.75,
            top: 550,
            child: DotsIndicator(
              dotsCount: 3,
              position: widget.currentPageValue.toInt(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                color: Colors.black26,
                activeColor: Colors.blue, // Set the active color here
                activeSize: const Size(20.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ), 
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: ElevatedButton(
              onPressed: widget.onNextButtonPressed,
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 14.0),
                  backgroundColor: Color(0xFF343D6B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              child: Text(
                widget.nextButtonLabel,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (widget.backButtonLabel != null &&
              widget.onBackButtonPressed != null)
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: TextButton(
                onPressed: widget.onBackButtonPressed,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Set the text color here
                ),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios,
                        color: Color(0xFF343D6B)), // Add back arrow icon
                    SizedBox(
                        width: 1.0
                            .w), // Add some spacing between the icon and text
                    Text(
                      widget.backButtonLabel!,
                      style: TextStyle(
                        color: Color(0xFF343D6B),
                        fontSize: 15.0.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

}