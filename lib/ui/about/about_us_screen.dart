import 'package:arnavbansal/constants/app_constants.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage(
                'assets/images/arnav_bansal.jpeg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.kWelcomeLine,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'My Story',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    AppConstants.kStoryLine1,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Why I Created This App',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    AppConstants.kWhyLine1,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'What Drives Me',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    AppConstants.kWhyLine2,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Get in Touch',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Text(
                      'Contact me at projectblujay17@gmail.com',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}