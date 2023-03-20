import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/bottom_bar_controller.dart';
class BottomNavigateBar extends StatelessWidget {
  
   BottomNavigateBar({Key? key}) : super(key: key);
  BottomBarController bottomBarController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      BottomNavigationBar(
        currentIndex:bottomBarController.bottomNBIndex.value ,
        type: BottomNavigationBarType.fixed,
        onTap: bottomBarController.indexChanged,
        selectedItemColor: Colors.blue,
        unselectedItemColor:Colors.green ,

        items:  const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined,),label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Person")
      //   Container(
      // width: 16.w,
      // height: 16.h,
      // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assest/icon/inbox.png"))),),),


      ],
      ),
    );
  }
}
