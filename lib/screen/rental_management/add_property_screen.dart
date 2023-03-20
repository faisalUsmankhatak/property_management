import 'dart:convert';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/owner_controller.dart';
import '../../controller/rent_add_property_Controller.dart';
import '../../widget/bottomBorderTextField.dart';
import '../../widget/drop_down_field.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({Key? key}) : super(key: key);

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  @override
  RentAddPropertyController rentAddPropertyController = Get.find();
  OwnerController ownerController = Get.find();
  // RxList<String> imageBytes=[''].obs;
  List<String> imageBytes1 = [''];
  // List<String> selectedItems = [];
  final CNICFormatter = MaskTextInputFormatter(
    mask: '#####-#######-#',
  );
  // int isFieldSelected = 0;

  //Rx<List<dynamic>> imageBytes=[].obs;

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(()=>
           Scaffold(
      floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 25.w, right: 5.w),
            child: FormButton(
              onTap: (){

                  rentAddPropertyController.addPropertyStepper.value++;


              },
                width: double.infinity,
                bodyColor: Colors.grey,
                buttonText: rentAddPropertyController.addPropertyStepper.value == 0
                    ? 'Next'
                    : 'Add Owner',
                borderColor: Colors.grey.withOpacity(0.5),
                radius: 50.sp,

            )),
      appBar: AppBar(
          backgroundColor: Color(0xffEDF0F6),
          elevation: 4.sp,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  20.sp,
                ),
                bottomLeft: Radius.circular(20.sp),
              ),
              borderSide: const BorderSide(color: Color(0xffEDF0F6))),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 16.w,
              height: 14.h,
             child: Image.asset('asset/icon/back.png',color: AppColors.purPleGradientTwoColor),
            ),
          ),
          title: Text("Add Property",
              style: AppStyles.appBarStyle()),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 18.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        if(rentAddPropertyController.addPropertyStepper.value>0){
                          rentAddPropertyController.addPropertyStepper.value--;

                        }
                      },
                      child: Row(children: [
                        Container(
                          width: 30.h,
                          height: 30.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: rentAddPropertyController.addPropertyStepper.value >= 0
                                  ? AppColors.purPleGradientTwoColor
                                  : AppColors.blackColor.withOpacity(0.4)),
                          child: Center(
                            child: Text('1',
                                style: TextStyle(color: AppColors.whiteColor)),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Text('Add Property',
                              style: TextStyle(
                                fontFamily: 'Roboto-Black',
                                  fontSize: 16.sp,
                                  color:
                                  rentAddPropertyController.addPropertyStepper.value >=
                                      0
                                      ? AppColors.purPleGradientTwoColor
                                      : AppColors.blackColor.withOpacity(0.4))),
                        ),
                      ],),
                    ),

                    SizedBox(
                      width: 10.h,
                    ),
                   Row(children: [
                     Container(
                       width: 30.h,
                       height: 30.h,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: rentAddPropertyController.addPropertyStepper.value == 1
                               ? AppColors.purPleGradientTwoColor
                               : AppColors.blackColor.withOpacity(0.4)),
                       child: Center(
                         child: Text('2',
                             style: TextStyle(color: AppColors.whiteColor)),
                       ),
                     ),
                     SizedBox(
                       width: 3.w,
                     ),
                     Container(
                       decoration: BoxDecoration(),
                       child: Text('Add Owner',
                           style: TextStyle(
                               fontFamily: 'Roboto-Black',
                               fontSize: 16.sp,
                               color:
                               rentAddPropertyController.addPropertyStepper.value ==
                                   1
                                   ? AppColors.purPleGradientTwoColor
                                   : AppColors.blackColor.withOpacity(0.4))),
                     ),
                   ],)
                  ],
                ),
                rentAddPropertyController.addPropertyStepper.value==0?       Column(
                  children: [


                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                        onPanDown: (details) {
                          setState(() {
                            rentAddPropertyController
                                .isChangeCategoryDropDownIcon = true;
                          });
                        },
                        child: DropDownField(
                          label: 'Category',
                          isChangeIcon: rentAddPropertyController
                              .isChangeCategoryDropDownIcon,
                          selectValue:  rentAddPropertyController.categoryController?.text==''?null: rentAddPropertyController.categoryController?.text,
                          labelWidth: 65,
                          menu: rentAddPropertyController.category,
                          onChange: (value) {
                            rentAddPropertyController.categoryController?.text =
                                value.toString();
                            setState(() {
                              rentAddPropertyController
                                  .isChangeCategoryDropDownIcon = false;
                            });

                            if (rentAddPropertyController
                                    .categoryController?.text ==
                                'Residential') {
                              print("re");

                              rentAddPropertyController.propertyType =
                                  rentAddPropertyController.residential;
                            } else if (rentAddPropertyController
                                    .categoryController?.text ==
                                'commercial') {
                              rentAddPropertyController.propertyType =
                                  rentAddPropertyController.commercial;
                            }

                            setState(() {
                              rentAddPropertyController
                                      .propertyTypeController.text =
                                  rentAddPropertyController.propertyType[0];
                            });
                          },
                        )),
                    SizedBox(
                      height: 18.h,
                    ),
                    GestureDetector(
                        onPanDown: (details) {
                          setState(() {
                            rentAddPropertyController
                                .isChangePropertyTypeDropDownIcon = true;
                          });
                        },
                        child: DropDownField(
                          label: 'Property Type',
                          isChangeIcon: rentAddPropertyController
                              .isChangePropertyTypeDropDownIcon,
                          labelWidth: 94,
                          selectValue:rentAddPropertyController.propertyTypeController.text==''?null: rentAddPropertyController
                              .propertyTypeController.text ,
                          menu: rentAddPropertyController.propertyType,
                          onChange: (value) {
                            rentAddPropertyController
                                .propertyTypeController.text = value.toString();

                            setState(() {
                              rentAddPropertyController
                                  .isChangePropertyTypeDropDownIcon = false;
                            });
                          },
                        )),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: AppFormTextField(
                          isCompulsory: true,
                          enabled: true,
                          lablel: 'Area (sq.ft)',
                          labelWidth: 76.w,
                          height: 40.h,
                        )),
                        SizedBox(
                          width:
                              (rentAddPropertyController
                                              .propertyTypeController.text ==
                                          "House" ||
                                      rentAddPropertyController
                                              .propertyTypeController.text ==
                                          "Plaza" ||
                                      rentAddPropertyController
                                              .propertyTypeController.text ==
                                          "Unit" ||
                                      rentAddPropertyController
                                              .propertyTypeController.text ==
                                          '')
                                  ? 0.w
                                  : 10.w,
                        ),
                        (rentAddPropertyController.propertyTypeController.text ==
                                    "House" ||
                                rentAddPropertyController
                                        .propertyTypeController.text ==
                                    "Plaza" ||
                                rentAddPropertyController
                                        .propertyTypeController.text ==
                                    "Unit" ||
                                rentAddPropertyController
                                        .propertyTypeController.text ==
                                    '')
                            ? SizedBox()
                            : Flexible(
                                child: GestureDetector(
                                  onPanDown: (details) {
                                    setState(() {
                                      rentAddPropertyController
                                          .isChangeSelectFlorDropDownIcon = true;
                                    });
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(bottom: 9.h),
                                      child: DropDownField(
                                        label: 'Select Floor',
                                        isChangeIcon: rentAddPropertyController
                                            .isChangeSelectFlorDropDownIcon,
                                        labelWidth: 82,
                                        selectValue:rentAddPropertyController.selectFloorController.text==''?null:  rentAddPropertyController
                                            .selectFloorController
                                            .text,
                                        menu: rentAddPropertyController.selectFloor,
                                        onChange: (value) {
                                          rentAddPropertyController
                                              .selectFloorController
                                              .text = value.toString();

                                          setState(() {
                                            rentAddPropertyController
                                                    .isChangeSelectFlorDropDownIcon =
                                                false;
                                          });
                                        },
                                      )),
                                ),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(
                      () => rentAddPropertyController.imageBytes.value.length == 1
                          ? AppFormTextField(
                              isCompulsory: true,
                              enabled: true,
                              textController:
                                  rentAddPropertyController.imageController.value,
                              lablel: "Upload Images",
                              // labelColor: propertyController.labelColor[5],
                              height: 40.sp,
                              labelWidth: 93,
                              suffixIcon: "asset/icon/file.jpg",
                              suffixIconTab: rentAddPropertyController.pickFileAgain)
                          : Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  //  height: 200,
                                  //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xff7742E0), width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: rentAddPropertyController
                                              .imageBytes.length,
                                          itemBuilder: (context, index) {
                                            if (rentAddPropertyController
                                                    .imageBytes[index] !=
                                                '') {
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 20.w,
                                                      height: 21.h,
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'asset/icon/uploadImageIcon.png'))),
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Text("Image ${index}"),
                                                    Expanded(child: SizedBox()),
                                                    Text(
                                                        "${rentAddPropertyController.imageBytes[index]}kb"),
                                                    Expanded(child: SizedBox()),
                                                    InkWell(
                                                        onTap: () {
                                                          if (rentAddPropertyController
                                                                  .imageBytes
                                                                  .length >=
                                                              1) {
                                                            print(
                                                                rentAddPropertyController
                                                                    .imageBytes);
                                                            print(
                                                                rentAddPropertyController
                                                                    .imageBase64Path);

                                                            rentAddPropertyController
                                                                .imageBytes
                                                                .removeAt(index);
                                                            rentAddPropertyController
                                                                .imageBase64Path
                                                                .removeAt(index);
                                                            print(
                                                                rentAddPropertyController
                                                                    .imageBytes);
                                                          }
                                                          if (rentAddPropertyController
                                                                  .imageBytes
                                                                  .length ==
                                                              0) {
                                                            rentAddPropertyController
                                                                .imageBytes
                                                                .removeAt(0);
                                                            rentAddPropertyController
                                                                .imageBase64Path
                                                                .removeAt(0);
                                                          }

                                                          print(index.toString());
                                                          setState(() {
                                                            // propertyController.  imageBytes1.value =   propertyController.imageBytes;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          size: 18,
                                                          color: Colors.red,
                                                        ))
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return SizedBox();
                                            }
                                          }),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                ),
                                Positioned(
                                    left: 12.w,
                                    top: -10.w,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 3.h,
                                          bottom: 3.h,
                                          left: 10.w,
                                          right: 10.w),
                                      color: Colors.white,
                                      child: Text(
                                        'Upload Images',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12.sp),
                                      ),
                                    )),
                                Positioned(
                                    left: 250.w,
                                    bottom: -15.w,
                                    child: InkWell(
                                      onTap: () {
                                        rentAddPropertyController.pickFileAgain();
                                      },
                                      child: Container(
                                          width: 40.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xff7742E0),
                                                  Color(0xff7A539C)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter),
                                            shape: BoxShape.circle,
                                            color: Color(0xff7742E0),
                                          ),

                                          // padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),

                                          child: Center(
                                            child: Icon(Icons.add,
                                                color: AppColors.whiteColor),
                                          )),
                                    )),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: ((rentAddPropertyController.imageBytes.length == 1 &&
                                  rentAddPropertyController.categoryController?.text ==
                                      'commercial') ||
                              rentAddPropertyController.categoryController?.text == '')
                          ? 18.h
                          : ((rentAddPropertyController.imageBytes.length == 1 &&
                                      rentAddPropertyController
                                              .categoryController?.text ==
                                          'Residential') ||
                                  rentAddPropertyController.categoryController?.text ==
                                      '')
                              ? 18.h
                              : 34.h,
                    ),
                    rentAddPropertyController.categoryController?.text == 'commercial'
                        ? GestureDetector(
                            onPanDown: (details) {
                              setState(() {
                                rentAddPropertyController
                                    .isChangeCommercialPropertyDropDownIcon = false;
                              });
                            },
                            child: DropDownField(
                              label: 'Commercial Properties',
                              isChangeIcon: rentAddPropertyController
                                  .isChangeCommercialPropertyDropDownIcon,
                              labelWidth: 144,
                              selectValue: rentAddPropertyController.commercialPropertiesController.text==''?null: rentAddPropertyController
                                  .commercialPropertiesController
                                  .text ,
                              menu: rentAddPropertyController.commercialProperties,
                              onChange: (value) {
                                rentAddPropertyController
                                    .commercialPropertiesController
                                    .text = value.toString();
                              },
                            ))
                        : rentAddPropertyController.categoryController?.text ==
                                'Residential'
                            ? Row(
                                children: [
                                  Flexible(
                                    child: GestureDetector(
                                        onPanDown: (details) {
                                          setState(() {
                                            rentAddPropertyController
                                                .isChangeConditionDropDownIcon = true;
                                          });
                                        },
                                        child: DropDownField(
                                          label: 'Condition',
                                          isChangeIcon: rentAddPropertyController
                                              .isChangeConditionDropDownIcon,
                                          labelWidth: 69,
                                          selectValue:  rentAddPropertyController.conditionController.text==''?null: rentAddPropertyController
                                              .conditionController
                                              .text,
                                          menu: rentAddPropertyController.condition,
                                          onChange: (value) {
                                            rentAddPropertyController
                                                .conditionController
                                                .text = value.toString();
                                            setState(() {
                                              rentAddPropertyController
                                                      .isChangeConditionDropDownIcon =
                                                  false;
                                            });
                                          },
                                        )),
                                  ),
                                ],
                              )
                            : SizedBox(),
                    SizedBox(
                        height: rentAddPropertyController.conditionController.text ==
                                'Furnished'
                            ? 18.h
                            : 0),
                    rentAddPropertyController.conditionController.text == 'Furnished'
                        ? Focus(
                            onFocusChange: (hasFocus) {
                              print(hasFocus.toString());
                              // propertyController.isClickedAddressField=false;

                              // setState(() => propertyController.facilitiesLabelColor =
                              //     hasFocus
                              //         ? AppColors.textFieldDefaultColor
                              //         : AppColors.purPleGradientOneColor);
                            },
                            child: GestureDetector(
                                onPanDown: (details) {
                                  print("lo");

                                  setState(() {
                                    rentAddPropertyController
                                        .isChangeFacilitiesDropDownIcon = true;
                                  });
                                },
                                child: multiSelectedDropDownField(
                                    rentAddPropertyController
                                        .isChangeFacilitiesDropDownIcon)),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: (rentAddPropertyController.categoryController?.text ==
                                  'commercial' ||
                              rentAddPropertyController.categoryController?.text ==
                                  'Residential')
                          ? 18.h
                          : 0.h,
                    ),
                    Container(
                      //  height:  tenantController.isHiddenMailingAddress?  300.h:36.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(
                              color: rentAddPropertyController.isHiddenMailingAddress
                                  ? AppColors.purPleGradientOneColor
                                  : Colors.transparent,
                              width: rentAddPropertyController.isHiddenMailingAddress
                                  ? 1.sp
                                  : 0)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                rentAddPropertyController.isHiddenMailingAddress =
                                    !rentAddPropertyController.isHiddenMailingAddress;
                              });
                            },
                            child: filterHidding('Mailing Address',
                                rentAddPropertyController.isHiddenMailingAddress),
                          ),
                          rentAddPropertyController.isHiddenMailingAddress
                              ? Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 255.h,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Flexible(
                                          child: SizedBox(
                                        //  height:45.h,

                                        child: BottomBorderTextField(
                                          hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                          isCompulsory: false,
                                          controller: rentAddPropertyController
                                              .buildingNameController,
                                        ),
                                      )),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                              child: BottomBorderTextField(
                                            hintText: "Line One",
                                            // hintText: 'Line One',
                                            isCompulsory: false,
                                            controller: rentAddPropertyController
                                                .lineOneController,
                                          )),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Flexible(
                                              child: BottomBorderTextField(
                                            hintText: "Line Two",
                                            isCompulsory: false,
                                            controller: rentAddPropertyController
                                                .lineTwoController,
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      BottomBorderTextField(
                                        hintText: "Area",
                                        isCompulsory: true,
                                        controller:
                                            rentAddPropertyController.AreaController,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Flexible(
                                          child: BottomBorderTextField(
                                        hintText: "City",
                                        isCompulsory: true,
                                        controller:
                                            rentAddPropertyController.AreaController,
                                      )),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Flexible(
                                          child: BottomBorderTextField(
                                        hintText: "Post Code",
                                        isCompulsory: false,
                                        controller:
                                            rentAddPropertyController.AreaController,
                                      )),
                                      SizedBox(
                                        height: rentAddPropertyController
                                                .isHiddenMailingAddress
                                            ? 18.h
                                            : 0.h,
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    SizedBox(
                        width: 950,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          maxLines: 5, // add this
                          style: const TextStyle(color: Colors.black),
                          // controller: importantNotes,
                          // onSaved: (String? value) {
                          //   importantNotes.text = value!;
                          // },
                          decoration: InputDecoration(
                            floatingLabelAlignment: FloatingLabelAlignment.start,
                            contentPadding: EdgeInsets.all(12.sp),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.sp,
                                    color: AppColors.purPleGradientOneColor),
                                borderRadius: BorderRadius.circular(5.sp)),
                            label: const Text('Discription',style: TextStyle(fontFamily: 'Roboto-Black')),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                                borderSide: BorderSide(color: AppColors.blackColor)),
                          ),
                        )),
                    // AppFormTextField(
                    //   lablel: "Discription",
                    //   focusBorderColor: AppColors.purPalGradientOneColor,
                    //   maxLines: 3,
                    //   isCompulsory: false,
                    //   enabled: true,
                    //   labelWidth: 70,
                    // ),
                  ],
                ):
                Column(
                  children: [
                    SizedBox(
                      height: 28.h,
                    ),

                    Row(
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onPanDown: (details) {

                              setState(() {
                                ownerController.isChangeOwnerTypeIcon=true;
                              });
                            },
                            child: DropDownField(
                              label: 'Owner Type',
                              isChangeIcon: ownerController.isChangeOwnerTypeIcon,
                              labelWidth: 79,
                              menu: ownerController.ownerType,
                              selectValue:ownerController.ownerTypeController.text==''?null:  ownerController.ownerTypeController
                                  .text,
                              onChange: (value) {
                                ownerController.ownerTypeController
                                    .text = value.toString();

                                setState(() {
                                  ownerController.isChangeOwnerTypeIcon=false;

                                });
                              },
                            ),),),

                        SizedBox(
                            width:
                            ownerController.ownerTypeController.text == 'Company'
                                ? 15.w
                                : 0.w),
                        ownerController.ownerTypeController.text == 'Company'
                            ? Flexible(
                          child: GestureDetector(
                              onPanDown: (details) {

                                setState(() {
                                  ownerController.isChangeCompanyTypeIcon=true;
                                });
                              },
                              child:DropDownField(
                                label: 'Company Type',
                                isChangeIcon:ownerController. isChangeCompanyTypeIcon,
                                labelWidth: 105,
                                selectValue: ownerController.companyTypeController.text==''?null :ownerController.companyTypeController.text,
                                menu: ownerController.companyType,
                                onChange: (value) {
                                  ownerController.companyTypeController
                                      .text = value.toString();

                                  setState(() {
                                    ownerController.isChangeCompanyTypeIcon=false;
                                  });
                                },
                              )
                            // dropDown("Company Type",
                            //     ownerController.companyType, 1, 10, 80),
                          ),
                        )
                            : SizedBox()
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    ownerController.ownerTypeController.text == 'Person'
                        ? Column(
                      children: [
                        Container(
                          width: double.infinity,
                          // height:ownerController.isHiddenPersonDetails? 350.h:37.5.h,

                          // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                          // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              border: Border.all(
                                  color: ownerController.isHiddenPersonDetails
                                      ? AppColors.purPleGradientOneColor
                                      : AppColors.whiteColor,
                                  width: 1.sp)),
                          child: Column(children: [
                            InkWell(
                              onTap: () {
                                ownerController.isClickedPersonDetails = true;
                                setState(() {
                                  ownerController.isHiddenPersonDetails =
                                  !ownerController.isHiddenPersonDetails;
                                });
                              },
                              child: filterHidding('Person Details',
                                  ownerController.isHiddenPersonDetails),
                            ),
                            ownerController.isHiddenPersonDetails
                                ? Container(
                              width: double.infinity,
                              padding:
                              EdgeInsets.symmetric(horizontal: 10.w),
                              //   height: ownerController.isHiddenPersonDetails? 310.h:37.5.h,
                              child: Column(children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: true,

                                          enabled: true,
                                          textController: ownerController
                                              .firstNameController,
                                          lablel: 'First Name',
                                          labelWidth: 75,

                                          height: 40,
                                        )),
                                    // Text(ownerController
                                    //     .companyFirstNameController.text),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,

                                          height: 40,
                                          textController: ownerController
                                              .lastNameController,
                                          lablel: 'Last Name',

                                          labelWidth: 75,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                AppFormTextField(
                                  isCompulsory: true,
                                  enabled: true,
                                  lablel: 'Phone Number',
                                  height: 40,
                                  typeKeyboard:
                                  TextInputType.number,
                                  textController: ownerController
                                      .phoneNumberController,

                                  labelWidth: 96,
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                AppFormTextField(
                                  height: 40,
                                  isCompulsory: true,
                                  enabled: true,

                                  lablel: 'Date Of Birth',
                                  labelWidth: 96,
                                  textController: ownerController
                                      .dateOfBirthController,
                                  suffixIcon:
                                  'asset/icon/calendar.png',
                                  suffixIconTab: () async {
                                    DateTime now = await DateTime.now();
                                    var newDate =
                                    await showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        firstDate:
                                        DateTime(1900),
                                        lastDate:
                                        DateTime(2024));
                                    DateFormat.yMd()
                                        .format(newDate!);
                                    setState(() {
                                      print(newDate);
                                      ownerController
                                          .dateOfBirthController
                                          .text = DateFormat
                                          .yMd()
                                          .format(newDate);
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                AppFormTextField(
                                  isCompulsory: true,
                                  enabled: true,

                                  lablel: 'Email',
                                  textController: ownerController
                                      .emailController,
                                  labelWidth: 43,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: AppFormTextField(
                                            isCompulsory: true,
                                            enabled: true,

                                            textController: ownerController
                                                .nicNumberController,
                                            lablel: 'Nic Number',
                                            typeKeyboard:
                                            TextInputType.number,
                                            labelWidth: 82,
                                            maskFormatter: CNICFormatter,
                                            maxLine: 15,
                                            height: 40,
                                            onChanged: (value) {})),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: false,
                                          enabled: true,

                                          lablel: 'Passport Number',
                                          height: 40,
                                          maxLine: 10,
                                          labelWidth: 100,
                                          textController: ownerController
                                              .passportNumberController,
                                          onChanged: (value) {},
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() => ownerController
                                              .imageLabelColor =
                                          hasFocus
                                              ? AppColors.purPleGradientOneColor
                                              : AppColors
                                              .textFieldDefaultColor);
                                        },
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,
                                          labelColor: ownerController
                                              .imageLabelColor,
                                          textController: ownerController
                                              .imageController,
                                          lablel: "Image",
                                          height: 40,
                                          labelWidth: 47,
                                          suffixIcon:
                                          "asset/icon/file.jpg",
                                          suffixIconTab: () {
                                            getImage(0);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Flexible(
                                      child: AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,

                                        textController: ownerController
                                            .agreementController,
                                        lablel: "Agreement",
                                        height: 40,
                                        labelWidth: 75,
                                        suffixIcon:
                                        "asset/icon/file.jpg",
                                        suffixIconTab: () {
                                          getImage(1);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                )
                              ]),
                            )
                                : SizedBox()
                          ]),
                        ),
                      ],
                    )
                        : ownerController.ownerTypeController.text == 'Company'
                        ? Container(
                      // height:  ((ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='Sole Trade'|| (ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='Limited company')))?  350.h:(ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='UnRegistered')?290.h:37.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(
                              color: ownerController.isClickedCompanyDetails
                                  ? AppColors.purPleGradientOneColor
                                  : Colors.transparent,
                              width: 1.sp)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              ownerController.isClickedCompanyDetails =
                              true;
                              setState(() {
                                ownerController.isHiddenCompanyDetails =
                                !ownerController.isHiddenCompanyDetails;
                              });
                            },
                            child: filterHidding('Company Details',
                                ownerController.isHiddenCompanyDetails),
                          ),
                          ownerController.isHiddenCompanyDetails
                              ? Container(
                            width: double.infinity,

                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w),
                            // height:((ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='Sole Trade')|| (ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='Limited company'))?  295.h:(ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='UnRegistered')?240.h:37.5.h,
                            child: Column(children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              AppFormTextField(
                                isCompulsory: true,
                                enabled: true,

                                textController: ownerController
                                    .companyNameController,
                                lablel: "Company Name",
                                height: 40,
                                labelWidth: 95,
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              (ownerController.companyTypeController.text ==
                                  'Sole Trade' ||
                                  ownerController
                                      .companyTypeController.text==
                                      'Limited company')
                                  ? Row(
                                children: [
                                  Flexible(
                                      child: AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,
                                        textController:
                                        ownerController
                                            .registrationNoController,

                                        lablel: 'Registration No',
                                        labelWidth: 94,
                                        height: 40,
                                      )),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  Flexible(
                                      child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,
                                          height: 40,
                                          textController:
                                          ownerController
                                              .regCertificateController,

                                          lablel:
                                          'Reg Certificate',
                                          suffixIcon:
                                          'asset/icon/file.jpg',
                                          suffixIconTab: () {
                                            getImage(5);
                                          },
                                          labelWidth: 91))
                                ],
                              )
                                  : SizedBox(),
                              (ownerController.companyTypeController.text==
                                  'Sole Trade' ||
                                  ownerController
                                      .companyTypeController.text==
                                      'Limited company')
                                  ? SizedBox(
                                height: 18.h,
                              )
                                  : SizedBox(),
                              Row(
                                children: [
                                  Flexible(
                                      child: AppFormTextField(
                                        isCompulsory: false,
                                        enabled: true,
                                        height: 40,
                                        typeKeyboard:
                                        TextInputType.number,
                                        textController: ownerController
                                            .landLineController,

                                        lablel: 'LandLine(PTCL)',
                                        labelWidth: 97,
                                      )),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  Flexible(
                                      child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,
                                          height: 40,
                                          typeKeyboard:
                                          TextInputType.number,
                                          textController:
                                          ownerController
                                              .mobileNoController,

                                          lablel: 'Mobile No#',
                                          labelWidth: 74))
                                ],
                              ),
                              SizedBox(
                                height: 18.w,
                              ),
                              AppFormTextField(
                                  isCompulsory: true,
                                  enabled: true,
                                  height: 40,
                                  textController: ownerController
                                      .companyEmailController,

                                  lablel: 'Company Email',
                                  labelWidth: 95),
                              SizedBox(
                                height: 18.h,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: AppFormTextField(
                                      isCompulsory: true,
                                      enabled: true,

                                      textController: ownerController
                                          .companyLogoController,
                                      lablel: "Company Logo",
                                      height: 40,
                                      labelWidth: 90,
                                      suffixIcon:
                                      "asset/icon/file.jpg",
                                      suffixIconTab: () {
                                        getImage(3);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  Flexible(
                                    child: AppFormTextField(
                                      isCompulsory: true,
                                      enabled: true,

                                      textController:
                                      ownerController
                                          .agreementController,
                                      lablel: "Agreement",
                                      height: 40,
                                      labelWidth: 71,
                                      suffixIcon:
                                      "asset/icon/file.jpg",
                                      suffixIconTab: () {
                                        getImage(4);
                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                            ]),
                          )
                              : SizedBox(),
                        ],
                      ),
                    )
                        : SizedBox(),
                    SizedBox(
                      height: 15.h,
                    ),
                    ownerController.ownerTypeController.text == 'Company'
                        ? Container(
                      width: double.infinity,
                      // height:ownerController.isHiddenContactPersonDetails? 290.h:37.5.h,

                      // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                      // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(
                              color:
                              ownerController.isHiddenContactPersonDetails
                                  ? AppColors.purPleGradientOneColor
                                  : Colors.transparent,
                              width: 1.sp)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                ownerController.isHiddenContactPersonDetails =
                                !ownerController
                                    .isHiddenContactPersonDetails;
                              });
                            },
                            child: filterHidding('Contact Person Details',
                                ownerController.isHiddenContactPersonDetails),
                          ),
                          ownerController.isHiddenContactPersonDetails
                              ? Container(
                            width: double.infinity,
                            padding:
                            EdgeInsets.symmetric(horizontal: 10.w),
                            //  height: ownerController.isHiddenContactPersonDetails? 240.h:37.5.h,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,
                                          textController: ownerController
                                              .firstNameController,
                                          lablel: 'First Name',
                                          labelWidth: 72,

                                          height: 40,
                                        )),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,
                                          height: 40,
                                          textController: ownerController
                                              .lastNameController,
                                          lablel: 'Last Name',
                                          labelWidth: 71,

                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,
                                          height: 40,
                                          lablel: 'Phone Number',
                                          typeKeyboard:
                                          TextInputType.number,
                                          textController: ownerController
                                              .phoneNumberController,
                                          labelWidth: 95,

                                        )),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,
                                          lablel: 'Date Of Birth',
                                          height: 40,
                                          textController: ownerController
                                              .dateOfBirthController,
                                          labelWidth: 81,

                                          suffixIcon:
                                          'asset/icon/calendar.png',
                                          suffixIconTab: () async {
                                            DateTime now = DateTime.now();
                                            DateTime? newDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: now,
                                                firstDate:
                                                DateTime(1900),
                                                lastDate:
                                                DateTime(2023));
                                            DateFormat.yMd()
                                                .format(newDate!);
                                            setState(() {
                                              ownerController
                                                  .dateOfBirthController
                                                  .text =
                                                  DateFormat.yMd()
                                                      .format(newDate);
                                            });
                                            print(newDate);
                                          },
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                AppFormTextField(
                                  isCompulsory: true,
                                  enabled: true,
                                  lablel: 'Email',
                                  height: 40,
                                  textController: ownerController
                                      .emailController,
                                  labelWidth:48,

                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: AppFormTextField(
                                            isCompulsory: true,
                                            enabled: true,
                                            height: 40,

                                            textController: ownerController
                                                .nicNumberController,
                                            lablel: 'Nic Number',
                                            typeKeyboard:
                                            TextInputType.number,
                                            labelWidth: 78,
                                            maskFormatter: CNICFormatter,
                                            maxLine: 15,
                                            onChanged: (value) {})),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Flexible(
                                      child: AppFormTextField(
                                        isCompulsory: false,
                                        enabled: true,
                                        lablel: 'Passport Number',
                                        maxLine: 10,
                                        labelWidth: 103,

                                        height: 40,
                                        textController: ownerController
                                            .passportNumberController,
                                        onChanged: (value) {},
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                )
                              ],
                            ),
                          )
                              : SizedBox(),
                        ],
                      ),
                    )
                        : SizedBox(),
                    ownerController.ownerTypeController.text == 'Company'
                        ? SizedBox(
                      height: 15.h,
                    )
                        : SizedBox(),
                    // ownerController.dropDownSelectedValue[0] == 'Company'?
                    (ownerController.ownerTypeController.text == 'Company' ||
                        ownerController.ownerTypeController.text == 'Person')
                        ? Container(
                      width: double.infinity,
                      // height: ownerController.isHiddenMailingAddress
                      //     ? 290.h
                      //     : 37.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(
                              color: ownerController.isHiddenMailingAddress
                                  ? AppColors.purPleGradientOneColor
                                  : AppColors.whiteColor,
                              width: 1.sp)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                ownerController.isHiddenMailingAddress =
                                !ownerController.isHiddenMailingAddress;
                              });
                            },
                            child: filterHidding('Mailing Address',
                                ownerController.isHiddenMailingAddress),
                          ),
                          ownerController.isHiddenMailingAddress
                              ? Container(
                            width: double.infinity,
                            padding:
                            EdgeInsets.symmetric(horizontal: 10.w),
                            // height: 238.h,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(children: [
                                  Flexible(
                                      child: SizedBox(
                                        height: 45.h,
                                        child: BottomBorderTextField(
                                          hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                          isCompulsory: false,
                                          controller: ownerController
                                              .mailingBuildingNameController,
                                        ),
                                      )),
                                ],)  ,
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: BottomBorderTextField(
                                          hintText: "Line One",
                                          // hintText: 'Line One',
                                          isCompulsory: false,
                                          controller: ownerController
                                              .mailingLineOneController,
                                        )),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Flexible(
                                        child: BottomBorderTextField(
                                          hintText: "Line Two",
                                          isCompulsory: false,
                                          controller: ownerController
                                              .mailingLineTwoController,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                BottomBorderTextField(
                                  hintText: "Area",
                                  isCompulsory: true,
                                  controller: ownerController
                                      .mailingAreaController,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(children: [Flexible(
                                    child: BottomBorderTextField(
                                      hintText: "City",
                                      isCompulsory: true,
                                      controller: ownerController
                                          .mailingCityController,
                                    )),],)    ,
                                SizedBox(
                                  width: 20.w,
                                ),
                                Row(children: [ Flexible(
                                    child: BottomBorderTextField(
                                      hintText: "Post Code",
                                      isCompulsory: false,
                                      controller:
                                      ownerController.mailingPostCodeController,
                                    )),],),
                                SizedBox(height: 18.h,),
                              ],
                            ),
                          )
                              : SizedBox(),
                        ],
                      ),
                    )
                        : SizedBox(),
                    (ownerController.ownerTypeController.text== 'Company' ||
                        ownerController.ownerTypeController.text == 'Person')
                        ? SizedBox(
                      height: 15.h,
                    )
                        : SizedBox(),
                    SizedBox(height: 13.h,),
                    (ownerController.ownerTypeController.text== 'Company' ||
                        ownerController.ownerTypeController.text == 'Person')
                        ? Row(
                      children: [
                        Text(
                            "If Permanent Address is Same with Mailing Address",
                            style: TextStyle(
                                color: AppColors.purPleGradientOneColor, fontSize: 10.sp,fontFamily: 'Roboto-Black')),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: AppColors.redColor),
                        ),
                        Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            setState(() {
                              ownerController.isPermanentMailingAddressSame=!ownerController.isPermanentMailingAddressSame;
                              if(ownerController.isPermanentMailingAddressSame){
                                assignPermanentAddressFieldValue();
                              }else{
                                clearPermanentAddressFieldValue();
                              }
                            });
                          },
                          child: Container(
                            width: 18.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blueColor,width: 1.w),
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Icon(Icons.done,size: 14.sp,color:ownerController.isPermanentMailingAddressSame? AppColors.blueColor:AppColors.whiteColor),
                          ),
                        )

                      ],
                    )
                        : SizedBox(),
                    SizedBox(
                      height: 6.h,
                    ),
                    (ownerController.ownerTypeController.text == 'Company' ||
                        ownerController.ownerTypeController.text == 'Person')
                        ? Container(
                      // height: ownerController.isHiddenPermanentAddress
                      //     ? 290.h
                      //     : 37.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(
                              color: ownerController.isHiddenPermanentAddress
                                  ? AppColors.purPleGradientOneColor
                                  : AppColors.whiteColor,
                              width: 1.sp)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                ownerController.isHiddenPermanentAddress =
                                !ownerController.isHiddenPermanentAddress;
                              });
                            },
                            child: filterHidding('Permanent Address',
                                ownerController.isHiddenPermanentAddress),
                          ),
                          ownerController.isHiddenPermanentAddress
                              ? Container(
                            width: double.infinity,
                            padding:
                            EdgeInsets.symmetric(horizontal: 10.w),
                            // height: 245.h,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 45.h,
                                  child: BottomBorderTextField(
                                    hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                    isCompulsory: false,
                                    controller: ownerController
                                        .permanentBuildingNameController,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: BottomBorderTextField(
                                          hintText: "Line One",
                                          // hintText: 'Line One',
                                          isCompulsory: false,
                                          controller: ownerController
                                              .permanentLineOneController,
                                        )),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Flexible(
                                        child: BottomBorderTextField(
                                          hintText: "Line Two",
                                          isCompulsory: false,
                                          controller: ownerController
                                              .permanentLineTwoController,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                BottomBorderTextField(
                                  hintText: "Area",
                                  isCompulsory: true,
                                  controller: ownerController
                                      .permanentAreaController,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                BottomBorderTextField(
                                  hintText: "City",
                                  isCompulsory: true,
                                  controller: ownerController
                                      .permanentCityController,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                BottomBorderTextField(
                                  hintText: "Post Code",
                                  isCompulsory: false,
                                  controller: ownerController
                                      .permanentPostCodeController,
                                ),
                                SizedBox(height: 18.h,)
                              ],
                            ),
                          )
                              : SizedBox(),
                        ],
                      ),
                    )
                        : SizedBox(),

                    (ownerController.ownerTypeController.text == 'Company' ||
                        ownerController.ownerTypeController.text == 'Person')
                        ? SizedBox(
                      height: 90.h,
                    )
                        : SizedBox()
                  ],
                ),
              ],
            ),
          ),
      ),
    ),
        ));
  }

  void uploadImages() async {
    print(rentAddPropertyController.imageBytes.value.length.toString());
    final ImagePicker _picker = ImagePicker();
    List<XFile>? pickImage = await _picker.pickMultiImage();
    if (pickImage.isNotEmpty) {
// images!.value=     pickImage.map((e){
//        File(e.path);
//
//      }).toList();
      for (XFile x in pickImage) {
        print(rentAddPropertyController.imageBytes[0]);
        Uint8List a = await x.readAsBytes();
        rentAddPropertyController.imageBase64Path.add(base64Encode(a));
        rentAddPropertyController.imageBytes.value
            .add((a.lengthInBytes / 1024).toString().split('.')[0]);
        setState(() {});
        print(base64Encode(a));
        print((a.lengthInBytes / 1024).toString().split('.')[0]);
        // imageBytes.addAll( x.readAsBytes());
        //  imageBytes.add() ;
      }
    }
  }

  Widget filterHidding(
    String title,
    bool isIconChange,
  ) {
    return Container(
      width: 312.w,
      padding: EdgeInsets.only(left: 5.w, top: 7.h, bottom: 7.h),
      decoration: BoxDecoration(
          color: AppColors.purPleGradientOneColor,
          borderRadius: BorderRadius.circular(3.sp),
          gradient: LinearGradient(
              colors: [Color(0xff7742E0), Color(0xff7A539C)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Text(
              title,
              style: AppStyles.filterLabelStyle(),
            ),
          ),
          const Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
          Expanded(child: SizedBox()),
          Icon(isIconChange ? Icons.expand_less : Icons.expand_more,
              color: AppColors.whiteColor),
          SizedBox(
            width: 7.w,
          )
        ],
      ),
    );
  }

  void assigenPropertyTypeValue() {
    if (rentAddPropertyController.categoryController?.text == 'Residential') {
      rentAddPropertyController.propertyType =
          rentAddPropertyController.residential;
    } else if (rentAddPropertyController.categoryController?.text ==
        'commercial') {
      rentAddPropertyController.propertyType =
          rentAddPropertyController.commercial;
    }
    //   print(propertyType);
    setState(() {
      rentAddPropertyController.propertyTypeController.text =
          rentAddPropertyController.propertyType[0];
    });
  }

  Widget multiSelectedDropDownField(bool value) {
    return SizedBox(
      height: 40.h,
      child: DropdownButtonFormField2(
        offset: Offset(0.sp, -12.sp),
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.sp)),
            border: Border.all(color: AppColors.purPleGradientOneColor)),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 15.h, bottom: 8.h, left: 10.w, right: 5.w),
          //symmetric(vertical: 10.sp,horizontal: 5.sp),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultColor),
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldDefaultColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.purPleGradientOneColor)),
          label: Text(
            'Facilities/ Extras',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.textFieldDefaultColor,
            ),
          ),
        ),
        // itemSplashColor: AppColors.purPalGradientOneColor,
        // itemHighlightColor: AppColors.purPalGradientOneColor,

        isExpanded: true,
        selectedItemHighlightColor: AppColors.purPleGradientOneColor,
        icon: Icon(
          rentAddPropertyController.isChangeFacilitiesDropDownIcon
              ? Icons.expand_less
              : Icons.expand_more,
          color: Colors.black45,
        ),

        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,

            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final _isSelected = rentAddPropertyController.selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    _isSelected
                        ? rentAddPropertyController.selectedItems.remove(item)
                        : rentAddPropertyController.selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Row(
                      children: [
                        _isSelected
                            ? Icon(Icons.check_box_outlined,
                                color: AppColors.purPleGradientOneColor)
                            : Icon(Icons.check_box_outline_blank,
                                color: AppColors.textFieldDefaultColor),
                        SizedBox(width: 16.h),
                        Text(
                          item,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textFieldDefaultColor),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: rentAddPropertyController.selectedItems.isEmpty ? null : rentAddPropertyController.selectedItems.last,

        onChanged: (value) {
          setState(() {
            rentAddPropertyController.isChangeFacilitiesDropDownIcon = false;
          });
        },

        buttonHeight: 20.sp,
        iconSize: 20.sp,
        //  buttonWidth: 140,
        itemHeight: 40.h,
        dropdownWidth: 310.w,

        itemPadding: EdgeInsets.zero,
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.topStart,
                //  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  rentAddPropertyController.selectedItems.join(', '),
                  style: TextStyle(
                      fontSize: 12.sp,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.textFieldDefaultColor),
                  maxLines: 1,
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }
  void getImage(int? index) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // file=File(result.files.single.path!);
      Uint8List imageBytes = await image.readAsBytes();
      ownerController.imageBase64 = base64Encode(imageBytes);
      setState(() {
        if (index == 0) {
          ownerController.imageController.text = image.name;
        } else if (index == 1) {
          ownerController.agreementController.text = image.name;
        } else if (index == 2) {
          ownerController.regCertificateController.text = image.name;
        } else if (index == 3) {
          ownerController.companyLogoController.text = image.name;
        } else if (index == 4) {
          ownerController.agreementController.text = image.name;
        } else if (index == 5) {
          ownerController.regCertificateController.text = image.name;
        }
      });
    }
  }

  void assignPermanentAddressFieldValue() {
    ownerController.permanentBuildingNameController.text =
        ownerController.mailingBuildingNameController.text;
    ownerController.permanentLineOneController.text =
        ownerController.mailingLineOneController.text;
    ownerController.permanentLineTwoController.text =
        ownerController.mailingLineTwoController.text;
    ownerController.permanentAreaController.text =
        ownerController.mailingAreaController.text;
    ownerController.permanentCityController.text =
        ownerController.mailingCityController.text;
    ownerController.permanentPostCodeController.text =
        ownerController.mailingPostCodeController.text;
    setState(() {});
  }

  void clearPermanentAddressFieldValue() {
    ownerController.permanentBuildingNameController.clear();
    ownerController.permanentLineOneController.clear();
    ownerController.permanentLineTwoController.clear();
    ownerController.permanentAreaController.clear();
    ownerController.permanentCityController.clear();
    ownerController.permanentPostCodeController.clear();
    setState(() {});
  }
}
