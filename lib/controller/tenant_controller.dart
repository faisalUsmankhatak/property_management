import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../app_confiq/app_colors.dart';

class TenantController extends GetxController{
  TextEditingController companyTypeController=TextEditingController();
  TextEditingController tenantTypeController=TextEditingController();


  //Company Details
  TextEditingController companyNameController=TextEditingController(text: '');
  TextEditingController registrationNoController=TextEditingController(text: '');
  TextEditingController regCertificateController=TextEditingController(text: '');
  TextEditingController landLineController=TextEditingController(text: '');
  TextEditingController mobileNoController=TextEditingController(text: '');
  TextEditingController companyEmailController=TextEditingController(text: '');
  TextEditingController companyLogoController=TextEditingController(text: '');
  TextEditingController agreementController=TextEditingController(text: '');
  // Person Details
  TextEditingController personFirstNameController=TextEditingController(text: '');
  TextEditingController personLastNameController=TextEditingController(text: '');
  TextEditingController personPhoneNumberController=TextEditingController(text: '');
  TextEditingController personDateOfBirthController=TextEditingController(text: '');
  TextEditingController personEmailController=TextEditingController(text: '');
  TextEditingController personNicNumberController=TextEditingController(text: '');
  TextEditingController personPassportNumberController=TextEditingController(text: '');
  TextEditingController personImageController=TextEditingController(text: '');
  TextEditingController personNicPhotoController=TextEditingController(text: '');


//contact Person Details
  TextEditingController contactFirstNameController=TextEditingController(text: '');
  TextEditingController contactLastNameController=TextEditingController(text: '');
  TextEditingController contactPhoneNumberController=TextEditingController(text: '');
  TextEditingController contactDateOfBirthController=TextEditingController(text: '');
  TextEditingController contactEmailController=TextEditingController(text: '');
  TextEditingController contactDesignationController=TextEditingController(text: '');

  
  TextEditingController mailingBuildingNameController=TextEditingController();
  TextEditingController mailingLineOneController=TextEditingController();
  TextEditingController mailingLineTwoController=TextEditingController();
  TextEditingController mailingAreaController=TextEditingController();
  TextEditingController mailingCityController=TextEditingController();
  TextEditingController mailingPostCodeController=TextEditingController();

  TextEditingController permanentBuildingNameController=TextEditingController();
  TextEditingController permanentLineOneController=TextEditingController();
  TextEditingController permanentLineTwoController=TextEditingController();
  TextEditingController permanentAreaController=TextEditingController();
  TextEditingController permanentCityController=TextEditingController();
  TextEditingController permanentPostCodeController=TextEditingController();
  bool isClickedPersonDetails=false;

  List<String> dropDownSelectedValue=['','Sole Trade',"Half year"];
  bool isHiddenPersonDetails=false;
  bool  isHiddenMailingAddress=false;
  bool  isHiddenPermanentAddress=false;
  bool  isHiddenRentDetails=false;
  bool isPermanentMailingAddressSame=false;
  bool isHiddenCompanyDetails=false;
  bool isHiddenContactPersonDetails=false;
  bool isChangeCompanyTypeDropDownIcon=false;
  bool isChangeTenantTypeDropDownIcon=false;
  String? imageBase64;
  List<String> tenantType=[
    'Sole Trade',
    'Limited company',
    'UnRegistered'
  ];
  List<String> companyType=[
    'Person',
    'Company',

  ];
  List<String> paymentTerm=[
    'Half year',
   'Monthly',
    'Bi-Month',
    'Quarterly',
    'Half Year',
    'Yearly',
    'Add yours'
  ];
 // String paymentTermSelectedValue='Half year';
}