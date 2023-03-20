import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomBarController extends GetxController{
  RxInt bottomNBIndex=0.obs;
  void indexChanged(int index){
    bottomNBIndex.value=index;
  }
}