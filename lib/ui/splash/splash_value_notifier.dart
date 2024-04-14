import 'package:arnavbansal/constants/app_constants.dart';
import 'package:arnavbansal/utils/logger_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashValueNotifier{

  final _logger = LoggerUtils();
  final _TAG = "SplashValueNotifier";

  Future<bool> init() async{
    final prefs = await SharedPreferences.getInstance();
    bool? isIntroScreensDisplayed =  prefs.getBool(AppConstants.kIntroKey);
    _logger.log(TAG: _TAG, message: "Is intro screens displayed $isIntroScreensDisplayed");
    if(isIntroScreensDisplayed != null && isIntroScreensDisplayed){
      return Future.value(isIntroScreensDisplayed);
    }
    else{
      await prefs.setBool(AppConstants.kIntroKey, true);
      return Future.value(false);
    }

  }

}