// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bottom_nav_movie/controllers/dasboard_control.dart';
import 'package:bottom_nav_movie/pages/menu/home_nav.dart';
import 'package:bottom_nav_movie/pages/menu/profile.dart';
import 'package:bottom_nav_movie/pages/menu/search_nav.dart';
import 'package:bottom_nav_movie/pages/menu/watch_list_nav.dart';
import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();

    final List<Widget> menus = [
      Homemenu(),
      Searchmenu(),
      WatchListmenu(),
      ProfilePage()
    ];

    return Obx(() {
      return Scaffold(
          body: menus[dashboardController.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: secondaryColor,
            selectedItemColor: dahscolor,
            unselectedItemColor: depcolor,
            currentIndex: dashboardController.selectedIndex.value,
            onTap: dashboardController.changeMenu,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border_rounded),
                  label: 'Watch list'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
            ],
          ));
    });
  }
}
