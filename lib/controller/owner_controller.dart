import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_confiq/app_colors.dart';


class OwnerController extends GetxController{
//Owner Type, Company Type
  TextEditingController ownerTypeController=TextEditingController(text: '');

  TextEditingController companyTypeController=TextEditingController(text: '');


  //Company Details
  TextEditingController companyNameController=TextEditingController(text: '');
  TextEditingController registrationNoController=TextEditingController(text: '');
  TextEditingController regCertificateController=TextEditingController(text: '');
  TextEditingController landLineController=TextEditingController(text: '');
  TextEditingController mobileNoController=TextEditingController(text: '');
  TextEditingController companyEmailController=TextEditingController(text: '');
  TextEditingController companyLogoController=TextEditingController(text: '');
  TextEditingController agreementController=TextEditingController(text: '');

  //contact Person Details
  TextEditingController firstNameController=TextEditingController(text: '');
  TextEditingController lastNameController=TextEditingController(text: '');
  TextEditingController phoneNumberController=TextEditingController(text: '');
  TextEditingController dateOfBirthController=TextEditingController(text: '');
  TextEditingController emailController=TextEditingController(text: '');
  TextEditingController nicNumberController=TextEditingController(text: '');
  TextEditingController passportNumberController=TextEditingController(text: '');

//Mailing Address
  TextEditingController mailingBuildingNameController=TextEditingController(text: '');
  TextEditingController mailingLineOneController=TextEditingController();
  TextEditingController mailingLineTwoController=TextEditingController();
  TextEditingController mailingAreaController=TextEditingController();
  TextEditingController mailingCityController=TextEditingController();
  TextEditingController mailingPostCodeController=TextEditingController();
  //Permanent Address
  TextEditingController permanentBuildingNameController=TextEditingController();
  TextEditingController permanentLineOneController=TextEditingController();
  TextEditingController permanentLineTwoController=TextEditingController();
  TextEditingController permanentAreaController=TextEditingController();
  TextEditingController permanentCityController=TextEditingController();
  TextEditingController permanentPostCodeController=TextEditingController();



  TextEditingController imageController=TextEditingController();
  Color imageLabelColor=AppColors.textFieldDefaultColor;






  String? imageBase64;
  //TextEditingController agreementController=TextEditingController();
  String? agreementBase64;
  bool isChangeOwnerTypeIcon=true;
  bool isChangeCompanyTypeIcon=true;
  bool isHiddenContactPersonDetails=false;
  bool isHiddenPersonDetails=false;
  bool isHiddenMailingAddress=false;
  bool isHiddenCompanyDetails=false;
  bool isHiddenPermanentAddress=false;
 bool isPermanentMailingAddressSame=false;

 // String ownerSelectedValue='';
  Color colorText=AppColors.textFieldDefaultColor;
 // List<String> dropDownSelectedValue=['','Sole Trade'];
  List<String> ownerType=[
    'Person',
    'Company'
  ];
  List<String> companyType=[
    'Sole Trade',
    'Limited company',
    'UnRegistered'
  ];
  bool isClickedPersonDetails=false;
  bool isClickedCompanyDetails=false;

  //String companyTypeSelectedValue='Sole Trade';
  String ownerTypeSelectedValue='';

}