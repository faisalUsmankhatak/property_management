import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/app_confiq/app_colors.dart';

import '../../controller/bottom_bar_controller.dart';

import '../../widget/bottom_navigation_bar.dart';

import '../inbox/inbox_screen.dart';
import '../search/search_screen.dart';
import 'home_screen.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  BottomBarController bottomBarController=Get.find();
final List _tabs=[
  HomeScreen(),
  const SearchScreen(),
  const InboxScreen(),
];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
bottomNavigationBar: BottomNavigateBar(),
        body:


            Obx(() => _tabs[bottomBarController.bottomNBIndex.value]),

          // ],
        ),
      );

  }




}
