import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_route_names.dart';
import 'package:news_app/features/article_details/article_details.dart';
import 'package:news_app/features/home/pages/home_view.dart';
import '../../features/splash/pages/splash_screen.dart';

class RouteGenerator{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
        switch(settings.name){
          case PageRouteNames.initial:
            return MaterialPageRoute(builder: (context) =>const SplashScreen(),settings: settings);
          case PageRouteNames.home:
            return MaterialPageRoute(builder: (context) => HomeView(),settings: settings);
          case PageRouteNames.articleDetails:
            return MaterialPageRoute(builder: (context) => ArticleDetails(),settings: settings);
          default:
            return MaterialPageRoute(builder: (context) =>const SplashScreen(),settings: settings);
        }
  }
}