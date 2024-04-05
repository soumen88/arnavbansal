import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../constants/color_constants.dart';
import '../common/empty_widget.dart';

@RoutePage()
class IntroScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: EmptyWidget(),
              bodyWidget: EmptyWidget(),
              image: buildImage("assets/images/intro_1.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: EmptyWidget(),
              bodyWidget: EmptyWidget(),
              image: buildImage("assets/images/intro_2.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: EmptyWidget(),
              bodyWidget: EmptyWidget(),
              image: buildImage("assets/images/intro_3.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: EmptyWidget(),
              bodyWidget: EmptyWidget(),
              image: buildImage("assets/images/intro_3.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {

          },
          //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          skip: EmptyWidget(),
          next: const Icon(
            Icons.forward,
            color: ColorConstants.kPinkColor,
          ),
          done: EmptyWidget(),
          onSkip: (){

          },
          dotsDecorator: getDotsDecorator()
      ),
    );
  }

  //widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
          imagePath,
        )
    );
  }


  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
        imagePadding: EdgeInsets.only(top: 120),
        pageColor: Colors.white,
        bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
        fullScreen: true
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: ColorConstants.kPinkColor,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}