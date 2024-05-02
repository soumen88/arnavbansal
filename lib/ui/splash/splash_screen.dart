import 'dart:async';

import 'package:arnavbansal/constants/app_constants.dart';
import 'package:arnavbansal/constants/color_constants.dart';
import 'package:arnavbansal/routing/app_router.dart';
import 'package:arnavbansal/ui/splash/splash_value_notifier.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () async{
      bool isHome = await SplashValueNotifier().init();
      //context.router.replace(const IntroRoute());
      /*if(isHome){
        context.router.replace(const BottomSheetRoute());
        //context.router.replace(const IntroRoute());
      }
      else{
        context.router.replace(const IntroRoute());
      }*/

      //context.router.replace(const VideoPlayerRoute());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kPurpleColorBackGround,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: 400,
          height: 400,
          fit: BoxFit.contain,
        ),
      ),
      bottomNavigationBar: Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: ColorConstants.kDarkPurpleColor,
        ),
        alignment: Alignment.center,
        child: const Text(
          AppConstants.kAppName,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }


}