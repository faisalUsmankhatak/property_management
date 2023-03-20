import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_confiq/app_colors.dart';
class AddBuyerDetailsController extends GetxController{
  TextEditingController selectTenantController=TextEditingController();
  Color selectTenantLabelColor= AppColors.textFieldDefaultColor;
  String? imageBase64;
  bool isHiddenMailingAddress=false;
  bool isHiddenPermanentAddress=false;
  bool isPermanentMailingAddressSame=false;
  bool isHiddenInstallmentDetails=false;

  bool isChangeDownPaymentDropDownIcon=false;

}
