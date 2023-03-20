import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../app_confiq/app_colors.dart';
class RentAddPropertyController extends GetxController{
  RxInt addPropertyStepper=0.obs;
  TextEditingController? categoryController=TextEditingController();
bool isChangeCategoryDropDownIcon=false;

  TextEditingController propertyTypeController=TextEditingController();
  bool isChangePropertyTypeDropDownIcon=false;
  TextEditingController areaController=TextEditingController(text: '');
  TextEditingController selectFloorController=TextEditingController();
  bool isChangeSelectFlorDropDownIcon=false;
  Rx<TextEditingController>  imageController=TextEditingController().obs;
  TextEditingController conditionController=TextEditingController();

  TextEditingController commercialPropertiesController=TextEditingController();

  TextEditingController descriptionController=TextEditingController();
  TextEditingController buildingNameController=TextEditingController();
  TextEditingController lineOneController=TextEditingController();
  TextEditingController lineTwoController=TextEditingController();
  TextEditingController AreaController=TextEditingController();
  Color facilitiesLabelColor=AppColors.textFieldDefaultColor;
 bool isChangeCommercialPropertyDropDownIcon=false;
  bool isChangeConditionDropDownIcon=false;
  bool isChangeFacilitiesDropDownIcon=false;
  bool isHiddenMailingAddress=false;
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



  List<String> commercial = [
    "Flat",
    "Office",
    "Shop",
    "Plaza",
    "Hall",
    "Unit",
    "Apartment",
    "Add yours"
  ];
  List<String> residential = [
    "Flat",
    "House",
    "Apartment",
    "Portion",
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
  List<String> selectedItems = [];
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