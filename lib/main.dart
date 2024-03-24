import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plugin/screens/pre_vehicle.dart';
import 'package:plugin/screens/splash_screen.dart';
import 'package:plugin/screens/map_screen.dart';
import 'package:plugin/screens/trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390,844),
      child: MaterialApp(
        title: 'Plugin',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

