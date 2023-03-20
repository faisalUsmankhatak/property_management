import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_confiq/app_colors.dart';
class RentController extends GetxController{

  TextEditingController selectTenantController=TextEditingController();
  TextEditingController selectPropertyController=TextEditingController();
  TextEditingController advanceRentController=TextEditingController();
  TextEditingController securityAmountController=TextEditingController();
  TextEditingController servicesController=TextEditingController();
  TextEditingController servicesTypeController=TextEditingController();
  TextEditingController rentController=TextEditingController();
  TextEditingController agreementStartController=TextEditingController();
  TextEditingController rentPaymentTermController=TextEditingController();
  TextEditingController rentAmountController=TextEditingController();
  TextEditingController rentDueDateController=TextEditingController();
  TextEditingController periodStartController=TextEditingController();
  TextEditingController periodEndController=TextEditingController();



  List<String> tenantName=['Faisal Usman','Sabahat Hussain','Rana zain'];
  List<String> services=['Cleaning','Television','Internet'];
  List<String> addServices=[];
  List<String> addServicesType=[];
  List<String> addRent=[];
  List<String> serviceCharges=['500','600','700'];

  List<String> servicesType=['Chargeable','Not Chargeable'];
  List<String> rent=['Included','Excluded'];
  bool isHiddenRentDetails=false;
  bool isChangeTenantDropDownIcon=false;
  bool isChangeSelectPropertyDropDownIcon=false;
  bool isChangeAdvanceRentDropDownIcon=false;
bool isChangeSecurityAmountDropDownIcon=false;
bool isChangeServicesDropDownIcon=false;
bool isChangeServicesTypeDropDownIcon=false;
bool isChangeRentDropDownIcon=false;

  RxBool isHiddenPropertiesDetails=false.obs;
  RxBool isHiddenTenantsDetails=false.obs;
  RxBool isHiddenRentsDetails=false.obs;
  RxBool isHiddenFacilitiesExtras=false.obs;

}