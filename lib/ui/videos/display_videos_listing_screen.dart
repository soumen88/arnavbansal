import 'package:arnavbansal/constants/app_constants.dart';
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
class DisplayVideosListingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

}