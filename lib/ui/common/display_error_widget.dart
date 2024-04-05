import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class DisplayErrorWidget extends StatelessWidget{
  String? errorMessage;

  DisplayErrorWidget({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/something_went_wrong.webp"),
              const SizedBox(height: 20,),
              Text(
                errorMessage ?? AppConstants.kSomethingWentWrong,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

}