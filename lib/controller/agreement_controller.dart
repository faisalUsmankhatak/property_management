import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AgreementController extends GetxController{
  RxString selectProperty=''.obs;
  Rx<TextEditingController> selectPropertyController=TextEditingController(text: '').obs;
TextEditingController propertyNameController=TextEditingController();
TextEditingController ownerCNICNoController=TextEditingController();
TextEditingController agentNameController=TextEditingController();
TextEditingController agentCNICNoController=TextEditingController();
TextEditingController propertySalePriceController=TextEditingController();
TextEditingController percentageController=TextEditingController();
TextEditingController commissionController=TextEditingController();
}