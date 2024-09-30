import 'package:bottom_nav_movie/binding/bindings.dart';
import 'package:bottom_nav_movie/pages/dashboard.dart';
import 'package:bottom_nav_movie/pages/login_page.dart';
import 'package:bottom_nav_movie/pages/menu/home_nav.dart';
import 'package:bottom_nav_movie/pages/menu/search_nav.dart';
import 'package:bottom_nav_movie/pages/menu/watch_list_nav.dart';
import 'package:bottom_nav_movie/splashsccreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(
            name: '/dashboard',
            page: () => DashboardPage(),
            binding: myBindings()),
        GetPage(name: '/search', page: () => Searchmenu()),
        GetPage(name: '/watch', page: () => WatchListmenu()),
        GetPage(name: '/home', page: () => Homemenu())
      ],
    );
  }
}
