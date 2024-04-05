import 'package:arnavbansal/constants/app_constants.dart';
import 'package:arnavbansal/core/default_firebase_options.dart';
import 'package:arnavbansal/core/firebase_remote_config_service.dart';
import 'package:arnavbansal/routing/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  await init();
  runApp(MyApp());
}

Future<void> init() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.getFirebaseOptions()
  );
  await FirebaseRemoteConfigService().initialize();
}

class MyApp extends StatelessWidget{

  AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.kAppName,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      builder: (BuildContext context, Widget? router){
        return router!;
      },
    );
  }

}