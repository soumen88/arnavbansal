import 'package:auto_route/auto_route.dart';

import '../ui/about/about_us_screen.dart';
import '../ui/bottom_sheet_screen.dart';
import '../ui/intro/intro_screens.dart';
import '../ui/splash/splash_screen.dart';
import '../ui/videos/display_videos_listing_screen.dart';
import '../ui/videos/video_player_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{
  List<AutoRoute> get routes => [
    AutoRoute(
        page: SplashRoute.page,
        path: "/splash",
        initial: true
    ),
    AutoRoute(
        page: IntroRoute.page,
        path: "/intro"
    ),
    AutoRoute(
        path: "/bottombarnavigation",
        page: BottomSheetRoute.page,
        children: [
          AutoRoute(
              page: DisplayVideosListingRoute.page,
              path: "videos"
          ),
          AutoRoute(
              page: AboutUsRoute.page,
              path: "aboutus"
          ),

        ]
    ),
    AutoRoute(
        page: VideoPlayerRoute.page,
        path: "/videoPlayer",
    ),
  ];
}