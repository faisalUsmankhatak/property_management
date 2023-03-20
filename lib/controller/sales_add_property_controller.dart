import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../app_confiq/app_colors.dart';
class SalesPropertyController extends GetxController{
  TextEditingController categoryController=TextEditingController(text: '');
  TextEditingController propertyTypeController=TextEditingController(text: '');
  TextEditingController areaController=TextEditingController(text: '');
  TextEditingController selectFloorController=TextEditingController(text: '');
  Rx<TextEditingController>  imageController=TextEditingController().obs;
  TextEditingController conditionController=TextEditingController(text: '');
  TextEditingController commercialPropertiesController=TextEditingController(text: '');
  TextEditingController descriptionController=TextEditingController(text: '');
  TextEditingController buildingNameController=TextEditingController(text: '');
  TextEditingController lineOneController=TextEditingController(text: '');
  TextEditingController lineTwoController=TextEditingController(text: '');
  TextEditingController AreaController=TextEditingController(text: '');
  Color facilitiesLabelColor=AppColors.textFieldDefaultColor;
 bool isHiddenPropertyDetails=false;
  bool isHiddenOwnerDetails=false;
  List<dynamic> propertyType = <dynamic>[];
  List<String> selectFloor = [

    "Basement",
    "Ground",
    "First",
    "Second",
    "Third",
    "Add Yours"
  ];
  List<String> category = [

    "Residential",
    "commercial",
    "Add Yours"
  ];
 bool isChangeCategoryDropDownIcon=false;
 bool isChangePropertyTypeDropDownIcon=false;
 bool isChangeSelectFloorDropDownIcon=false;
 bool isChangePropertyQuantityDropDownIcon=false;
 bool isChangeKitchenDropDownIcon=false;
 bool isChangeBedroomDropDownIcon=false;
 bool isChangeWashroomDropDownIcon=false;
 bool isChangeQuantityDropDownIcon=false;

  bool isChangePropertyIcon = true;
  bool isChangeSelectFloorIcon = true;
  bool isChangeConditionIcon = true;
  bool isChangeCommercialPropertyIcon = true;
  bool  isHiddenAddress=false;
  bool isHiddenMailingAddress=false;
  bool isPermanentMailingAddressSame=false;
  bool isHiddenPermanentAddress=false;
  List<bool> isChangeDropDownIcon=[false,false,false];
  //List<String?> dropDownSelectedValue=['',null,'Basement',];
  List<String> commercial = [
    "Unit",
    "Plaza",
    "Hall",
    "Shop",
    "Office",
    "Flat",
    "Apartment",

  ];
  List<String> residential = [
    "Plot",
    "Flat",
    "Apartment",
    "House",
  ];
  List<String> condition = [

    "Furnished",
    "Un-Furnished",

  ];
  List<String> conditionPropertyType = [

    "White Goods",
    "Furniture + WGs",
    'TV',
    'Curtains',
    'Oven',
    'Utensils',
    'Add Yours'

  ];
  List<String> commercialProperties = [
    "Fitted",
    "Un-Fitted",

  ];
  String? imageBase64;
  RxList<String> imageBytes=[''].obs;
  // RxList<String> imageBytes1=[''].obs;
  //Rx<List<dynamic>> imageBytes=[].obs;

  // RxList<File> images = (List<File>.of([])).obs;
  List<String> imageBase64Path=[''];


  Future<void> pickFileAgain() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? pickImage = await _picker.pickMultiImage();
    for(XFile file in pickImage){
      Uint8List a=await file.readAsBytes();
      imageBase64Path.add(base64Encode(a));
      imageBytes.add((a.lengthInBytes/1024).toString().split('.')[0]);
    }
    print(imageBytes.length.toString());
    // for(int a=1;a<imageBytes1.length;a++){
    //   imageBytes1.removeAt(a);
    // }
    // print("length"+imageBytes1.length.toString());
    //   imageBytes1.value = imageBytes;
    //   print(imageBytes1.value.length.toString());

  }
}