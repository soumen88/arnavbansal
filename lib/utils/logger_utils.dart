import 'dart:developer' as developer;
class LoggerUtils{
  void log({required String TAG, required String message}){
    developer.log(message, name: TAG);
  }
}