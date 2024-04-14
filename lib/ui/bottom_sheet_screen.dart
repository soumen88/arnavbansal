import 'package:arnavbansal/routing/app_router.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constants/color_constants.dart';

@RoutePage()
class BottomSheetScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: ColorConstants.kPurpleColorBackGround,
      /*appBarBuilder: (BuildContext context, TabsRouter tabsRouter){
        if(tabsRouter.activeIndex == 0){
          return AppBar(
            title: Text("Home Screen"),
          );
        }
        else if(tabsRouter.activeIndex == 1){
          return AppBar(
            title: Text("Mental Health Videos"),
          );
        }
        else{
          return AppBar(
            title: Text("Contact with us"),
          );
        }
      },*/
      routes: [
        DisplayVideosListingRoute(),
        AboutUsRoute()
      ],
      bottomNavigationBuilder: (BuildContext context, TabsRouter tabsRouter){
        return SalomonBottomBar(
          selectedItemColor: Colors.white,
          items: [
            SalomonBottomBarItem(
                icon: Icon(Icons.video_call),
                title: Text("Videos")
            ),
            SalomonBottomBarItem(
                icon: Icon(Icons.people),
                title: Text("About us")
            )
          ],
          onTap: (int index){
            return tabsRouter.setActiveIndex(index);
          },
          currentIndex: tabsRouter.activeIndex,
        );
      },
    );
  }

}