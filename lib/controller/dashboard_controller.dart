import 'dart:ui';

import 'package:get/get.dart';

class DashboardController extends GetxController {
  // List<Color> dashboardGridentColor = [
  //   const Color(0xff37B899),
  //   const Color(0xffEEBA00),
  //   const Color(0xff246BFD),
  //   const Color(0xffED7474),
  //   const Color(0xffD45757),
  //   const Color(0xff009571)
  // ];
  List<Map> grideViewDataList=[
    {
      "title":"Rent Colllection",
      "color":Color(0xff37B899),
      "buttonTitle":"Rent Collection"
    },
    {
      "title":"Owners",
      "color":Color(0xffEEBA00),
      "buttonTitle":"Owners"
    },
    {
      "title":"Tanants",
      "color":const Color(0xff246BFD),
      "buttonTitle":"Tanants"
    },
    {
      "title":"Sold (Installments)",
      "color":const Color(0xffED7474),
      "buttonTitle":"Installments"
    },
    {
      "title":"Sold (Full Payment)",
      "color":const Color(0xffD45757),
      "buttonTitle":"Sale"
    },
    {
      "title":"(Agent Agreements)",
      "color":const Color(0xff009571),
      "buttonTitle":"Agent Agreements"
    }
  ];
}
