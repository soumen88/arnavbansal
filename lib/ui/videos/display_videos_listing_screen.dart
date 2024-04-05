import 'package:arnavbansal/constants/app_constants.dart';
import 'package:arnavbansal/constants/color_constants.dart';
import 'package:arnavbansal/routing/app_router.dart';
import 'package:arnavbansal/ui/common/custom_loader.dart';
import 'package:arnavbansal/ui/common/display_error_widget.dart';
import 'package:arnavbansal/ui/videos/video_card_item.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/models/video_model.dart';
import '../../core/video_listing_config.dart';

@RoutePage()
class DisplayVideosListingScreen extends StatefulWidget{
  @override
  State<DisplayVideosListingScreen> createState() => _DisplayVideosListingScreenState();
}

class _DisplayVideosListingScreenState extends State<DisplayVideosListingScreen> {


  late String categoryName;

  @override
  void initState() {
    categoryName = AppConstants.categoryList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
          centerTitle: true,
          actions: [
            PopupMenuButton(onSelected: (value) {
              categoryName = value;
              setState(() {

              });
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text(AppConstants.categoryList[0]),
                  value: AppConstants.categoryList[0],
                ),
                PopupMenuItem(
                  child: Text(AppConstants.categoryList[1]),
                  value: AppConstants.categoryList[1],
                ),
                PopupMenuItem(
                  child: Text(AppConstants.categoryList[2]),
                  value: AppConstants.categoryList[2],
                ),
                PopupMenuItem(
                  child: Text(AppConstants.categoryList[3]),
                  value: AppConstants.categoryList[3],
                ),
                PopupMenuItem(
                  child: Text(AppConstants.categoryList[4]),
                  value: AppConstants.categoryList[4],
                ),

              ];
            })
          ],
        ),
      body: Center(
        child: FutureBuilder(
          future: VideoListingConfig().hitServerToFetchVideosList(),
          builder: (BuildContext context, AsyncSnapshot<List<VideoModel>> snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting :{
                return const CustomLoader();
              }
              default:{
                if(snapshot.hasError){
                  return DisplayErrorWidget(errorMessage: snapshot.error.toString() );
                }
                else{
                  List<VideoModel> videosList = snapshot.data!;
                  return ListView.builder(
                      itemCount: videosList.length,
                      itemBuilder: (BuildContext context, int index){
                        VideoModel currentVideoModel = videosList[index];
                        return VideoCardItem(
                            currentVideoModel: currentVideoModel,
                            onVideoTapped: (){
                              context.router.navigate(VideoPlayerRoute(videoId: currentVideoModel.videoIDs ?? ''));
                            },
                        );
                      }
                  );
                }
              }
            }
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> prepareCategoryDropdown(List<VideoModel> videosList){

    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"),value: "USA"),
      DropdownMenuItem(child: Text("Canada"),value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
      DropdownMenuItem(child: Text("England"),value: "England"),
    ];
    return menuItems;
  }
}