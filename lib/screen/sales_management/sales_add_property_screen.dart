import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';

import '../../controller/sales_add_property_controller.dart';
import '../../widget/bottomBorderTextField.dart';
import '../../widget/drop_down_field.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';

class SalesAddPropertyScreen extends StatefulWidget {
  const SalesAddPropertyScreen({Key? key}) : super(key: key);

  @override
  State<SalesAddPropertyScreen> createState() => _SalesAddPropertyScreenState();
}

class _SalesAddPropertyScreenState extends State<SalesAddPropertyScreen> {
  SalesPropertyController salesPropertyController =Get.put(SalesPropertyController());
  @override
  List<String> imageBytes1 = [''];
  List<String> selectedItems = [];

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
        child: Scaffold(
          floatingActionButton: Padding(
              padding: EdgeInsets.only(left: 25.w,right: 5.w),
              child: FormButton(width: double.infinity,bodyColor: Colors.grey,buttonText: 'Submit',borderColor: Colors.grey.withOpacity(0.5),radius: 50.sp)),
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
                borderSide: BorderSide(color: Color(0xffEDF0F6))),
            leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                width: 16.w,
                height: 14.h,
                child: Image.asset('asset/icon/back.png',color: AppColors.redGradientTwoColor),
              ),
            ),
            title: Text("Add Property",
                style: AppStyles.appBarStyle(color: AppColors.redGradientTwoColor)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 28.h,
                  ),
                  Container(
                    width: double.infinity,
                    //height:tenantController.isHiddenContactPersonDetails? 290.h:36.5.h,

                    // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                    // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color:salesPropertyController.isHiddenPropertyDetails?AppColors.redGradientTwoColor:AppColors.whiteColor,width: 1.sp)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              salesPropertyController
                                  .isHiddenPropertyDetails =! salesPropertyController.isHiddenPropertyDetails;
                            });
                          },
                          child:    filterHidding('Property Details',salesPropertyController
                              .isHiddenPropertyDetails),

                        ),

                        salesPropertyController.isHiddenPropertyDetails?         Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          //  height: tenantController.isHiddenContactPersonDetails? 240.h:37.5.h,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(children: [
                                Flexible(
                                  child: GestureDetector(
                                    onPanDown: (details) {
                                      print("onclik");
                                      setState(() {


                                       // salesPropertyController.isChangeDropDownIcon[0] = false;
                                      });
                                    },
                                    child: GestureDetector(
                                        child: DropDownField(
                                          label: 'Category',
                                         isChangeIcon:salesPropertyController.isChangeCategoryDropDownIcon ,
                                          labelWidth: 70,
                                          menu: salesPropertyController.category,
                                          onChange: (value) {
                                            salesPropertyController.categoryController.text =
                                                value.toString();


                                            setState(() {
                                              // propertyController.isChangeCategoryIcon = true;
                                            });

                                            if (salesPropertyController.categoryController.text ==
                                                'Residential') {
                                              print("re");

                                              salesPropertyController.propertyType =
                                                  salesPropertyController.residential;
                                            } else if (salesPropertyController.categoryController.text ==
                                                'commercial') {
                                              salesPropertyController.propertyType =
                                                  salesPropertyController.commercial;
                                            }

                                            setState(() {
                                              // salesPropertyController.propertyTypeController.text =
                                              // salesPropertyController.propertyType[0];
                                            });
                                          },
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Flexible(
                                  child: GestureDetector(
                                      onPanDown: (details) {

                                        setState(() {
                                          salesPropertyController.isChangePropertyIcon = false;
                                        });
                                      },
                                      child: DropDownField(
                                        label: 'Property Type',
                                        isChangeIcon: salesPropertyController.isChangePropertyTypeDropDownIcon,
                                        labelWidth: 82,
                                        menu: salesPropertyController.propertyType,
                                        onChange: (value) {
                                          salesPropertyController.propertyTypeController.text =
                                              value.toString();

                                          setState(() {});
                                        },
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: 18.h,
                              ),






                              AppFormTextField(
                                isCompulsory: true,

                                enabled: true,
                                lablel: 'Area (sq.ft)',

                                labelWidth: 66.w,
                                height: 40.h,
                              ),
                              SizedBox(
                                height:
                                (salesPropertyController.propertyTypeController.text !=
                                    "" )
                                    ? 18.w
                                    : 0.w,
                              ),
                              (salesPropertyController.propertyTypeController.text == "Flat" ||
                                  salesPropertyController.propertyTypeController.text ==
                                      "Apartment" ||
                                  salesPropertyController.propertyTypeController.text ==
                                      "House"
                                  )
                                  ?
                                  GestureDetector(
                                    onPanDown: (details) {

                                      setState(() {
                                        salesPropertyController.isChangeSelectFloorIcon =
                                        false;
                                      });
                                    },
                                    child: Padding(
                                        padding:  EdgeInsets.only(bottom: 9.h),
                                        child: DropDownField(
                                          label: 'Select Floor',
                                         isChangeIcon: salesPropertyController.isChangeSelectFloorDropDownIcon,
                                          labelWidth: 79,
                                          menu: salesPropertyController.selectFloor,
                                          onChange: (value) {
                                            salesPropertyController.selectFloorController
                                                .text = value.toString();

                                            setState(() {});
                                          },
                                        )),
                                  )
                                  : (salesPropertyController.propertyTypeController.text == "Plot" && salesPropertyController.propertyTypeController.text != "")?
                              GestureDetector(
                                  onPanDown: (details) {

                                    setState(() {
                                      salesPropertyController.isChangePropertyIcon = false;
                                    });
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.only(bottom: 8.h),
                                    child: DropDownField(

                                      label: 'Property Quantity',
                                      isChangeIcon:salesPropertyController.isChangePropertyQuantityDropDownIcon ,
                                      labelWidth: 79,
                                      menu: salesPropertyController.propertyType,
                                      onChange: (value) {

                                      },
                                    ),
                                  )):const SizedBox(),
                              SizedBox(
                                height: (salesPropertyController.propertyTypeController.text!='Plot' && salesPropertyController.propertyTypeController.text!='')?18.h:0.h,
                              ),

                                (salesPropertyController.propertyTypeController.text!='Plot' && salesPropertyController.propertyTypeController.text!='')  ?          GestureDetector(

                                  child: GestureDetector(
                                      child: DropDownField(
                                        label: 'No Of Kitchen',
                                        isChangeIcon: salesPropertyController.isChangeKitchenDropDownIcon,
                                        labelWidth: 88,
                                        menu: salesPropertyController.category,
                                        onChange: (value) {

                                        },
                                      )),
                                ):SizedBox(),
                              (salesPropertyController.propertyTypeController.text!='Plot' && salesPropertyController.propertyTypeController.text!='')  ?           SizedBox(height: 18.w,):SizedBox(),
                                (salesPropertyController.propertyTypeController.text!='Plot' && salesPropertyController.propertyTypeController.text!='')  ?     GestureDetector(

                                    child: DropDownField(
                                      label: 'No Of Bedroom',
                                      isChangeIcon:salesPropertyController.isChangeBedroomDropDownIcon ,
                                      labelWidth: 100,
                                      menu: salesPropertyController.propertyType,
                                      onChange: (value) {

                                      },
                                    )):SizedBox(),
                              SizedBox(
                                height: (salesPropertyController.propertyTypeController.text!='Plot' && salesPropertyController.propertyTypeController.text!='') ? 18.h:0.h,
                              ),

        (salesPropertyController.propertyTypeController.text!='Plot' && salesPropertyController.propertyTypeController.text!='')?        GestureDetector(

          child: GestureDetector(
              child: DropDownField(
                label: 'No Of Washroom',
                isChangeIcon: salesPropertyController.isChangeWashroomDropDownIcon,
                labelWidth: 100,
                menu: salesPropertyController.category,
                onChange: (value) {

                },
              )),
        ):SizedBox(),
        (salesPropertyController.propertyTypeController.text!='Plot' && salesPropertyController.propertyTypeController.text!='')?               SizedBox(height: 18.w,):SizedBox(),
        (salesPropertyController.propertyTypeController.text!='Plot' && salesPropertyController.propertyTypeController.text!='')?                GestureDetector(
            onPanDown: (details) {

              setState(() {
                salesPropertyController.isChangePropertyIcon = false;
              });
            },
            child: DropDownField(
              label: 'Property Quantity',
            isChangeIcon:salesPropertyController.isChangeQuantityDropDownIcon ,
              labelWidth: 110,
              menu: salesPropertyController.propertyType,
              onChange: (value) {

              },
            )):SizedBox(),



                              SizedBox(
                                height: salesPropertyController.categoryController.text!='Plot' ? 18.h:0.h,
                              ),
                              Obx(
                                    () => salesPropertyController.imageBytes.value.length == 1
                                    ? AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,

                                        textController:
                                        salesPropertyController.imageController.value,
                                        lablel: "Image",
                                        // labelColor: propertyController.labelColor[5],
                                        height: 40.sp,
                                        labelWidth: 90,

                                        suffixIcon: "asset/icon/file.jpg",
                                        suffixIconTab: getProfileImage)
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
                                              itemCount:
                                              salesPropertyController.imageBytes.length,
                                              itemBuilder: (context, index) {
                                                if (salesPropertyController
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
                                                            "${salesPropertyController.imageBytes[index]}kb"),
                                                         Expanded(child: SizedBox()),
                                                        InkWell(
                                                            onTap: () {
                                                              if (salesPropertyController
                                                                  .imageBytes
                                                                  .length >=
                                                                  1) {
                                                                print(salesPropertyController
                                                                    .imageBytes);
                                                                print(salesPropertyController
                                                                    .imageBase64Path);

                                                                salesPropertyController
                                                                    .imageBytes
                                                                    .removeAt(index);
                                                                salesPropertyController
                                                                    .imageBase64Path
                                                                    .removeAt(index);
                                                                print(salesPropertyController
                                                                    .imageBytes);
                                                              }
                                                              if (salesPropertyController
                                                                  .imageBytes
                                                                  .length ==
                                                                  0) {
                                                                salesPropertyController
                                                                    .imageBytes
                                                                    .removeAt(0);
                                                                salesPropertyController
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
                                            salesPropertyController.pickFileAgain();
                                          },
                                          child: Container(
                                              width: 40.w,
                                              height: 40.h,
                                              decoration:  BoxDecoration(
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
                               height: 18.h,
                              ),
                              multiSelectedDropDownField(),


                              SizedBox(height: 18.h,),
                            ],
                          ),
                        )
                            :SizedBox(),

                      ],
                    ),
                  ),

                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    width: double.infinity,
                    //height:tenantController.isHiddenContactPersonDetails? 290.h:36.5.h,

                    // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                    // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color:salesPropertyController.isHiddenOwnerDetails?AppColors.redGradientTwoColor:AppColors.whiteColor,width: 1.sp)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              salesPropertyController
                                  .isHiddenOwnerDetails =! salesPropertyController
                                  .isHiddenOwnerDetails;
                            });
                          },
                          child:    filterHidding('Owner Details',salesPropertyController
                              .isHiddenOwnerDetails),

                        ),

                        salesPropertyController
                            .isHiddenOwnerDetails?         Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          //  height: tenantController.isHiddenContactPersonDetails? 240.h:37.5.h,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      child: Focus(
                                        onFocusChange: (hasFocus) {

                                        },
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,

                                          textController: salesPropertyController.lineTwoController,
                                          lablel: 'First Name',
                                          labelWidth: 72,
                                          labelColor: salesPropertyController.facilitiesLabelColor,
                                          height: 40,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  Flexible(
                                      child: Focus(
                                        onFocusChange: (hasFocus) {
                                          // setState(() =>tenantController.contactLastNameLabelColor = hasFocus ? AppColors.purpalColor : AppColors.textFieldDefaultColor);
                                        },
                                        child: AppFormTextField(

                                          isCompulsory: true,
                                          enabled: true,

                                          height: 40,
                                          textController: salesPropertyController.lineTwoController,
                                          lablel: 'Last Name',
                                          labelWidth: 71,
                                          labelColor: salesPropertyController.facilitiesLabelColor,
                                        ),
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
                                          // setState(() =>tenantController.contactPhoneNumberLabelColor = hasFocus ? AppColors.purpalColor : AppColors.textFieldDefaultColor);
                                        },
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,

                                          height: 40,
                                          lablel: 'Phone Number',
                                          typeKeyboard: TextInputType.number,
                                          textController: salesPropertyController.lineTwoController,
                                          labelWidth: 89,
                                          labelColor: salesPropertyController.facilitiesLabelColor,
                                        ),
                                      )),

                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Focus(
                                onFocusChange: (hasFocus) {
                                  // setState(() =>tenantController.contactEmailLabelColor = hasFocus ? AppColors.purpalColor : AppColors.textFieldDefaultColor);
                                },
                                child: AppFormTextField(
                                  isCompulsory: true,

                                  enabled: true,
                                  lablel: 'Email',
                                  height: 40,
                                  textController:  salesPropertyController.lineTwoController,
                                  labelWidth: 41,
                                  labelColor: salesPropertyController.facilitiesLabelColor,
                                ),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),


                              Row(
                                children: [
                                  Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        // setState(() =>salesPropertyController.personImageLabelColor = hasFocus ? AppColors.purpalColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                        isCompulsory: true,

                                        enabled: true,
                                        labelColor:  salesPropertyController.facilitiesLabelColor,
                                        textController: salesPropertyController.AreaController,
                                        lablel: "CNIC Front",
                                        height: 40,
                                        labelWidth: 70,
                                        suffixIcon: "asset/icon/file.jpg",
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
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        // setState(() =>tenantController.personNicPhotoLabelColor = hasFocus ? AppColors.purpalColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                        isCompulsory: true,

                                        enabled: true,
                                        labelColor:salesPropertyController.facilitiesLabelColor ,
                                        textController: salesPropertyController.AreaController,
                                        lablel: "CNIC Back",
                                        height: 40,
                                        labelWidth: 70,
                                        suffixIcon: "asset/icon/file.jpg",
                                        suffixIconTab:() {
                                          getImage(1);
                                        },),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 18.h,),
                            ],
                          ),
                        )
                            :SizedBox(),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    //  height:  tenantController.isHiddenMailingAddress?  300.h:36.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(
                            color: salesPropertyController.isHiddenMailingAddress
                                ? AppColors.redGradientOneColor
                                : Colors.transparent,
                            width: salesPropertyController.isHiddenMailingAddress
                                ? 1.sp
                                : 0)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              salesPropertyController.isHiddenMailingAddress =
                              !salesPropertyController.isHiddenMailingAddress;
                            });
                          },
                          child: filterHidding('Mailing Address',
                              salesPropertyController.isHiddenMailingAddress),
                        ),
                        salesPropertyController.isHiddenMailingAddress
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
                                      controller: salesPropertyController
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
                                        controller:
                                        salesPropertyController.lineOneController,
                                      )),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Flexible(
                                      child: BottomBorderTextField(
                                        hintText: "Line Two",
                                        isCompulsory: false,
                                        controller:
                                        salesPropertyController.lineTwoController,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              BottomBorderTextField(
                                hintText: "Area",
                                isCompulsory: true,
                                controller: salesPropertyController.AreaController,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Flexible(
                                  child: BottomBorderTextField(
                                    hintText: "City",
                                    isCompulsory: true,
                                    controller: salesPropertyController.AreaController,
                                  )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Flexible(
                                  child: BottomBorderTextField(
                                    hintText: "Post Code",
                                    isCompulsory: false,
                                    controller: salesPropertyController.AreaController,
                                  )),
                              SizedBox(
                                height:
                                salesPropertyController.isHiddenMailingAddress
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
                  Row(
                    children: [
                      Text("If Permanent Address is Same with Mailing Address",style: TextStyle(color: AppColors.redGradientOneColor,fontSize: 10.sp,fontFamily: 'Roboto-Black')),SizedBox(width: 2.w,),
                      Text('*',style: TextStyle(color: AppColors.redColor),),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          setState(() {
                            salesPropertyController.isPermanentMailingAddressSame=!salesPropertyController.isPermanentMailingAddressSame;
                            if(salesPropertyController.isPermanentMailingAddressSame){
                              //  assignPermanentAddressFieldValue();
                            }else{
                              // clearPermanentAddressFieldValue();
                            }
                          });
                        },
                        child: Container(
                          width: 18.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.redGradientOneColor,width: 1.w),
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Icon(Icons.done,size: 14.sp,color:salesPropertyController.isPermanentMailingAddressSame? AppColors.redGradientOneColor:AppColors.whiteColor),
                        ),
                      )
                    ],),
                  SizedBox(height: 18.h,),
                  Container(

                    // height:  tenantController.isHiddenPermanentAddress?  300.h:36.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color:salesPropertyController.isHiddenPermanentAddress? AppColors.redGradientOneColor:Colors.transparent,width:salesPropertyController.isHiddenPermanentAddress? 1.sp:0)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              salesPropertyController
                                  .isHiddenPermanentAddress =! salesPropertyController
                                  .isHiddenPermanentAddress;
                            });
                          },
                          child:filterHidding('Permanent Address',salesPropertyController.isHiddenPermanentAddress),

                        ),
                        salesPropertyController.isHiddenPermanentAddress  ?      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height:255.h,
                          child: Column(
                            children: [
                              SizedBox(height: 10.h,),
                              Flexible(child: SizedBox(
                                // height:45.h,

                                child: BottomBorderTextField(
                                  hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                  isCompulsory: false,
                                  controller:salesPropertyController.AreaController,
                                ),
                              )),
                              SizedBox(height: 5.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: BottomBorderTextField(
                                    hintText: "Line One",
                                    // hintText: 'Line One',
                                    isCompulsory: false,
                                    controller:salesPropertyController.AreaController,)),
                                  SizedBox(width: 20.w,),
                                  Flexible(child: BottomBorderTextField(
                                    hintText: "Line Two",
                                    isCompulsory: false,
                                    controller:salesPropertyController.AreaController,)),
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              BottomBorderTextField(
                                hintText: "Area",
                                isCompulsory: true,
                                controller:salesPropertyController.AreaController,
                              ),
                              SizedBox(height: 5.h,),
                              Flexible(child: BottomBorderTextField(
                                hintText: "City",
                                isCompulsory: true,
                                controller:salesPropertyController.AreaController,)),
                              SizedBox(width: 20.w,),
                              Flexible(child: BottomBorderTextField(
                                hintText: "Post Code",
                                isCompulsory: false,
                                controller:salesPropertyController.AreaController,)),
                              SizedBox(height:salesPropertyController.isHiddenPermanentAddress? 18.h:0.h,)
                            ],
                          ),
                        ):SizedBox(),
                        SizedBox(height: 18.h,),

                      ],
                    ),
                  ),
SizedBox(height: 80.h,)
                ],
              ),
            ),
          ),
        ));
  }

  void getProfileImage() async {
    print(salesPropertyController.imageBytes.value.length.toString());
    final ImagePicker _picker = ImagePicker();
    List<XFile>? pickImage = await _picker.pickMultiImage();
    if (pickImage.isNotEmpty) {
// images!.value=     pickImage.map((e){
//        File(e.path);
//
//      }).toList();
      for (XFile x in pickImage) {
        print(salesPropertyController.imageBytes[0]);
        Uint8List a = await x.readAsBytes();
        salesPropertyController.imageBase64Path.add(base64Encode(a));
        salesPropertyController.imageBytes.value
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
          gradient:  LinearGradient(
              colors: [AppColors.redGradientOneColor, AppColors.redGradientTwoColor],
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
          Icon(isIconChange ? Icons.expand_more : Icons.expand_less,
              color: AppColors.whiteColor),
          SizedBox(
            width: 7.w,
          )
        ],
      ),
    );
  }

  void assigenPropertyTypeValue() {
    if (salesPropertyController.categoryController.text == 'Residential') {
      salesPropertyController.propertyType = salesPropertyController.residential;
    } else if (salesPropertyController.categoryController.text == 'commercial') {
      salesPropertyController.propertyType = salesPropertyController.commercial;
    }
    //   print(propertyType);
    setState(() {
      salesPropertyController.propertyTypeController.text =
      salesPropertyController.propertyType[0];
    });
  }

  Widget multiSelectedDropDownField() {
    return SizedBox(
      height: 40.h,
      child: DropdownButtonFormField2(
        offset: Offset(0.sp, -12.sp),
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.sp)),
            border: Border.all(color: AppColors.redGradientOneColor)),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 5.w),
          //symmetric(vertical: 10.sp,horizontal: 5.sp),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.blackColor.withOpacity(0.4)),
          ),
          disabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: salesPropertyController.facilitiesLabelColor)),
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.redGradientOneColor)),
          label: Text(
            'Facilities',
            style: TextStyle(
              fontSize: 10.sp,
              color: salesPropertyController.facilitiesLabelColor,
            ),
          ),
        ),
        // itemSplashColor: AppColors.purPalGradientOneColor,
        // itemHighlightColor: AppColors.purPalGradientOneColor,

        isExpanded: true,
        selectedItemHighlightColor: AppColors.purPleGradientOneColor,
        icon: Icon(
          salesPropertyController.isChangeDropDownIcon[0]
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
                final _isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    _isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        _isSelected
                            ? Icon(Icons.check_box_outlined,
                            color: AppColors.redGradientOneColor)
                            : Icon(Icons.check_box_outline_blank,
                            color: AppColors.textFieldDefaultColor),
                        const SizedBox(width: 16),
                        Text(
                          item,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
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
        value: selectedItems.isEmpty ? null : selectedItems.last,

        onChanged: (value) {
          print('ok');
        },

        buttonHeight: 20.sp,
        iconSize: 20.sp,
        //  buttonWidth: 140,
        itemHeight: 40,
        dropdownWidth: 310.w,

        itemPadding: EdgeInsets.zero,
        selectedItemBuilder: (context) {
          return items.map(
                (item) {
              return Container(
                alignment: AlignmentDirectional.topStart,
                //  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  selectedItems.join(', '),
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
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
      salesPropertyController.imageBase64 = base64Encode(imageBytes);
      setState(() {
        if(index==0){
          // tenantController.personImageController.text = image.name;

        }else if(index==1){
          //  ownerController.personAgreementController.text=image.name;
        }else if(index==2){
          // ownerController.regCertificateController.text=image.name;
        }else if(index==3){
          //  ownerController.companyLogoController.text=image.name;
        }else if(index==4){
          //  ownerController.agreementController.text=image.name;
        }else if(index==5){
          //  ownerController.regCertificateController.text=image.name;
        }

      });
    }
  }
}
