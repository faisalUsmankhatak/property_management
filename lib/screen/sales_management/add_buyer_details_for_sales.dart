import 'dart:convert';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/add_byuer_details_controller.dart';
import '../../widget/bottomBorderTextField.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';
class AddBuyerDetailsForSales extends StatefulWidget {
  const AddBuyerDetailsForSales({Key? key}) : super(key: key);

  @override
  State<AddBuyerDetailsForSales> createState() => _AddBuyerDetailsForSalesState();
}

class _AddBuyerDetailsForSalesState extends State<AddBuyerDetailsForSales> {
  AddBuyerDetailsController addBuyerDetailsController=Get.put(AddBuyerDetailsController());
  final List<String> items = [
    'G15 Property',
    'G16 Property',
    'F7 Property',
    'F8 property',
  ];
  List<String> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
        title: Text("Add Buyer Details For Sale",
            style: AppStyles.appBarStyle(color: AppColors.redGradientTwoColor)),
        actions: [

          SizedBox(
            width: 16.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                          // ownerController
                          //     .isClickedPersonDetails =
                          // true;

                          // setState(() =>
                          // ownerController
                          //     .firstNameLabelColor =
                          // hasFocus
                          //     ? AppColors.purpalColor
                          //     : AppColors
                          //     .textFieldDefaultColor);
                        },
                        child: AppFormTextField(
                          isCompulsory: true,

                          enabled: true,
                          textController:
                          addBuyerDetailsController.selectTenantController,
                          lablel: 'First Name',
                          labelWidth: 70,
                          labelColor:
                          addBuyerDetailsController
                              .selectTenantLabelColor,
                          height: 40,
                        ),
                      )),
                  // Text(ownerController
                  //     .companyFirstNameController.text),
                  SizedBox(
                    width: 18.w,
                  ),
                  Flexible(
                      child: Focus(
                        onFocusChange: (hasFocus) {

                          // setState(() => ownerController
                          //     .lastNameLabelColor =
                          // hasFocus
                          //     ? AppColors.purpalColor
                          //     : AppColors
                          //     .textFieldDefaultColor);
                        },
                        child: AppFormTextField(
                          isCompulsory: true,

                          enabled: true,
                          height: 40,
                          textController: addBuyerDetailsController
                              .selectTenantController,
                          lablel: 'Number',
                          labelColor: addBuyerDetailsController
                              .selectTenantLabelColor,
                          labelWidth: 68,
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
                          // ownerController
                          //     .isClickedPersonDetails =
                          // true;
                          setState(() => addBuyerDetailsController
                              .selectTenantLabelColor =
                          hasFocus
                              ? AppColors.purPleGradientOneColor
                              : AppColors
                              .textFieldDefaultColor);
                        },
                        child: AppFormTextField(
                          height: 40,
                          isCompulsory: true,

                          enabled: true,
                          labelColor: addBuyerDetailsController
                              .selectTenantLabelColor,
                          lablel: 'Email',
                          labelWidth: 81,
                          textController: addBuyerDetailsController
                              .selectTenantController,


                        ),
                      )),
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
                        setState(() => addBuyerDetailsController
                            .selectTenantLabelColor =
                        hasFocus
                            ? AppColors.purPleGradientOneColor
                            : AppColors
                            .textFieldDefaultColor);
                      },
                      child: AppFormTextField(
                        isCompulsory: true,

                        enabled: true,
                        labelColor: addBuyerDetailsController
                            .selectTenantLabelColor,
                        textController: addBuyerDetailsController
                            .selectTenantController,
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
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() => addBuyerDetailsController
                            .selectTenantLabelColor =
                        hasFocus
                            ? AppColors.purPleGradientOneColor
                            : AppColors
                            .textFieldDefaultColor);
                      },
                      child: AppFormTextField(
                        isCompulsory: true,
                        enabled: true,

                        labelColor: addBuyerDetailsController
                            .selectTenantLabelColor,
                        textController: addBuyerDetailsController
                            .selectTenantController,
                        lablel: "Agreement",
                        height: 40,
                        labelWidth: 70,
                        suffixIcon:
                        "asset/icon/file.jpg",
                        suffixIconTab: () {
                          getImage(1);
                        },
                      ),
                    ),
                  )
                ],
              ),
SizedBox(height: 18.h,),
              Container(
                // height: addBuyerDetailsController.isHiddenMailingAddress
                //     ? 290.h
                //     : 37.5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(
                        color: addBuyerDetailsController.isHiddenMailingAddress
                            ? AppColors.redGradientOneColor
                            : AppColors.whiteColor,
                        width: 1.sp)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          addBuyerDetailsController.isHiddenMailingAddress =
                          !addBuyerDetailsController.isHiddenMailingAddress;
                        });
                      },
                      child: filterHidding('Mailing Address',
                          addBuyerDetailsController.isHiddenMailingAddress),
                    ),
                    addBuyerDetailsController.isHiddenMailingAddress
                        ? Container(
                      width: double.infinity,
                      padding:
                      EdgeInsets.symmetric(horizontal: 10.w),
                      height: 245.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Flexible(
                              child: SizedBox(
                                height: 45.h,
                                child: BottomBorderTextField(
                                  hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                  isCompulsory: false,
                                  controller: addBuyerDetailsController
                                      .selectTenantController,
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
                                    controller: addBuyerDetailsController
                                        .selectTenantController,
                                  )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Flexible(
                                  child: BottomBorderTextField(
                                    hintText: "Line Two",
                                    isCompulsory: false,
                                    controller:addBuyerDetailsController
                                        .selectTenantController,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          BottomBorderTextField(
                            hintText: "Area",
                            isCompulsory: true,
                            controller: addBuyerDetailsController
                                .selectTenantController,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Flexible(
                              child: BottomBorderTextField(
                                hintText: "City",
                                isCompulsory: true,
                                controller: addBuyerDetailsController
                                    .selectTenantController,
                              )),
                          SizedBox(
                            width: 20.w,
                          ),
                          Flexible(
                              child: BottomBorderTextField(
                                hintText: "Post Code",
                                isCompulsory: false,
                                controller:
                                addBuyerDetailsController
                                    .selectTenantController,
                              )),
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
                  Text("If Permanent Address is Same with Mailing Address",style: TextStyle(color: AppColors.redGradientOneColor,fontSize: 10.sp)),SizedBox(width: 2.w,),
                  Text('*',style: TextStyle(color: AppColors.redColor),),
                  Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      setState(() {
                        addBuyerDetailsController.isPermanentMailingAddressSame=!addBuyerDetailsController.isPermanentMailingAddressSame;
                        if(addBuyerDetailsController.isPermanentMailingAddressSame){
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
                      child: Icon(Icons.done,size: 14.sp,color:addBuyerDetailsController.isPermanentMailingAddressSame? AppColors.redGradientOneColor:AppColors.whiteColor),
                    ),
                  )
                ],),
              SizedBox(height: 18.h,),
              Container(
                // height: addBuyerDetailsController.isHiddenMailingAddress
                //     ? 290.h
                //     : 37.5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(
                        color: addBuyerDetailsController.isHiddenPermanentAddress
                            ? AppColors.redGradientOneColor
                            : AppColors.whiteColor,
                        width: 1.sp)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          addBuyerDetailsController.isHiddenPermanentAddress =
                          !addBuyerDetailsController.isHiddenPermanentAddress;
                        });
                      },
                      child: filterHidding('Permanent Address',
                          addBuyerDetailsController.isHiddenPermanentAddress),
                    ),
                    addBuyerDetailsController.isHiddenPermanentAddress
                        ? Container(
                      width: double.infinity,
                      padding:
                      EdgeInsets.symmetric(horizontal: 10.w),
                      height: 245.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Flexible(
                              child: SizedBox(
                                height: 45.h,
                                child: BottomBorderTextField(
                                  hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                  isCompulsory: false,
                                  controller: addBuyerDetailsController
                                      .selectTenantController,
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
                                    controller: addBuyerDetailsController
                                        .selectTenantController,
                                  )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Flexible(
                                  child: BottomBorderTextField(
                                    hintText: "Line Two",
                                    isCompulsory: false,
                                    controller:addBuyerDetailsController
                                        .selectTenantController,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          BottomBorderTextField(
                            hintText: "Area",
                            isCompulsory: true,
                            controller: addBuyerDetailsController
                                .selectTenantController,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Flexible(
                              child: BottomBorderTextField(
                                hintText: "City",
                                isCompulsory: true,
                                controller: addBuyerDetailsController
                                    .selectTenantController,
                              )),
                          SizedBox(
                            width: 20.w,
                          ),
                          Flexible(
                              child: BottomBorderTextField(
                                hintText: "Post Code",
                                isCompulsory: false,
                                controller:
                                addBuyerDetailsController
                                    .selectTenantController,
                              )),
                        ],
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
              ),
              SizedBox(height: 18.h,),
              multiSelectedDropDownField()
            ],
          ),
        ),
      ),
    ));
  }

  void getImage(int? index) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // file=File(result.files.single.path!);
      Uint8List imageBytes = await image.readAsBytes();
      addBuyerDetailsController.imageBase64 = base64Encode(imageBytes);
      setState(() {
        if (index == 0) {
          addBuyerDetailsController.selectTenantController.text = image.name;
        } else if (index == 1) {
          addBuyerDetailsController.selectTenantController.text = image.name;
        } else if (index == 2) {
          addBuyerDetailsController.selectTenantController.text = image.name;
        }
      });
    }
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
              BorderSide(color: AppColors.blackColor.withOpacity(0.4))),
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.redGradientOneColor)),
          label: Text(
            'Select Property',
            style: TextStyle(
              fontSize: 10.sp,
              color: addBuyerDetailsController.selectTenantLabelColor,
            ),
          ),
        ),
        // itemSplashColor: AppColors.purPalGradientOneColor,
        // itemHighlightColor: AppColors.purPalGradientOneColor,

        isExpanded: true,
        selectedItemHighlightColor: AppColors.redGradientOneColor,
        icon: Icon(
          // addBuyerDetailsController.isChangeDropDownIcon[0]
          //     ? Icons.expand_less
          //     :
          Icons.expand_more,
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
              colors: [AppColors.redGradientOneColor,
                AppColors.redGradientTwoColor

              ],
              begin: Alignment.bottomCenter,
              end:Alignment.topCenter
          )),
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
}
