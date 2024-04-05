import 'dart:convert';

import 'package:arnavbansal/utils/logger_utils.dart';

import '../constants/app_constants.dart';
import 'firebase_remote_config_service.dart';
import 'models/video_model.dart';

class VideoListingConfig{
  final _logger = LoggerUtils();
  final _TAG = "VideoListingConfig";
  final remoteConfig = FirebaseRemoteConfigService();

  Future<List<VideoModel>> hitServerToFetchVideosList() async{
    List<VideoModel> videosList = [];
    try{
      var videosJson = json.decode(remoteConfig.getString(AppConstants.kVideosJson)) ;

      for(var individualVideo in videosJson){
        VideoModel videoModel = VideoModel.fromJson(individualVideo);
        _logger.log(TAG: _TAG, message: "Videos json $videoModel");
        videosList.add(videoModel);
      }
      return Future.value(videosList);
    }
    catch(exception){
      _logger.log(TAG: _TAG, message: "Exception in fetching");
      return Future.error("Failed to fetch videos from server");
    }
  }
}