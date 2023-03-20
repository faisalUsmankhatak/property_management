import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/add_byuer_details_controller.dart';
import '../../widget/bottomBorderTextField.dart';
import '../../widget/drop_down_field.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';
class AddBuyerAndInstallment extends StatefulWidget {
  const AddBuyerAndInstallment({Key? key}) : super(key: key);

  @override
  State<AddBuyerAndInstallment> createState() => _AddBuyerAndInstallmentState();
}

class _AddBuyerAndInstallmentState extends State<AddBuyerAndInstallment> {
  @override
  List<String> menu=['Yes','NO'];
  AddBuyerDetailsController addBuyerDetailsController=Get.put(AddBuyerDetailsController());
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
          child:  Container(
            width: 16.w,
            height: 14.h,
            child: Image.asset('asset/icon/back.png',color: AppColors.redGradientTwoColor),
          ),
        ),
        title: Text("Add Buyer & Installment",
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
              Container(

                //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(color:addBuyerDetailsController.isHiddenInstallmentDetails?AppColors.redGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                child: Column(
                  children: [
                    InkWell(
                      onTap:(){
                        // tenantController.isClickedCompanyDetails=true;
                        setState(() {
                          addBuyerDetailsController
                              .isHiddenInstallmentDetails =! addBuyerDetailsController
                              .isHiddenInstallmentDetails;
                        });
                      },
                      child:filterHidding('Installment Details',addBuyerDetailsController.isHiddenInstallmentDetails),

                    ),
                    addBuyerDetailsController.isHiddenInstallmentDetails  ?      Container(
                      width: double.infinity,


                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
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
                                        //  ownerController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,

                                        textController: addBuyerDetailsController.selectTenantController,
                                        labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                        lablel: 'Property Sales Prices',
                                        labelWidth: 94,
                                        height: 40,
                                      ),
                                    )),

                              ],
                            ),


                            SizedBox(height: 18.h,),
                            Row(
                              children: [
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  ownerController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: DropDownField(menu: menu,
                                        isChangeIcon: addBuyerDetailsController.isChangeDownPaymentDropDownIcon,
                                        labelWidth: 60.w, label: 'Down Payment',onChange: (valu){},)
                                    )),
                                SizedBox(
                                  width: 18.w,
                                ),
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  tenantController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor= hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,

                                          height: 40,
                                          textController: addBuyerDetailsController.selectTenantController,
                                          labelColor:addBuyerDetailsController.selectTenantLabelColor ,
                                          lablel: '',

                                          labelWidth: 91),
                                    ))
                              ],
                            ),


                            SizedBox(height: 18.h,),
                            Row(
                              children: [
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  ownerController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                        isCompulsory: true,

                                        enabled: true,
                                        textController: addBuyerDetailsController.selectTenantController,
                                        labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                        lablel: 'Payment at Completion',
                                        labelWidth: 94,
                                        height: 40,
                                      ),
                                    )),
                                SizedBox(
                                  width: 18.w,
                                ),
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  tenantController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor= hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                          isCompulsory: true,

                                          enabled: true,
                                          height: 40,
                                          textController: addBuyerDetailsController.selectTenantController,
                                          labelColor:addBuyerDetailsController.selectTenantLabelColor ,
                                          lablel: '',

                                          labelWidth: 91),
                                    ))
                              ],
                            ),
                            SizedBox(height: 18.h,),
                            Row(
                              children: [
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  ownerController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,

                                        textController: addBuyerDetailsController.selectTenantController,
                                        labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                        lablel: 'Payment at Balloting',
                                        labelWidth: 94,
                                        height: 40,
                                      ),
                                    )),
                                SizedBox(
                                  width: 18.w,
                                ),
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  tenantController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor= hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                          isCompulsory: true,

                                          enabled: true,
                                          height: 40,
                                          textController: addBuyerDetailsController.selectTenantController,
                                          labelColor:addBuyerDetailsController.selectTenantLabelColor ,
                                          lablel: '',

                                          labelWidth: 91),
                                    ))
                              ],
                            ),


                            SizedBox(height: 18.h,),
                            Focus(
                              onFocusChange: (hasFocus) {
                                //  ownerController.isClickedCompanyDetails=true;
                                setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                              },
                              child: AppFormTextField(
                                isCompulsory: true,

                                enabled: true,
                                textController: addBuyerDetailsController.selectTenantController,
                                labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                lablel: 'Amount to be paid by installment',
                                labelWidth: 94,
                                height: 40,
                              ),
                            ),
                            SizedBox(height: 18.h,),
                            SizedBox(height: 18.h,),
                            Focus(
                              onFocusChange: (hasFocus) {
                                //  ownerController.isClickedCompanyDetails=true;
                                setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                              },
                              child: AppFormTextField(
                                isCompulsory: true,

                                enabled: true,
                                textController: addBuyerDetailsController.selectTenantController,
                                labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                lablel: 'Select installment plan',
                                labelWidth: 94,
                                height: 40,
                              ),
                            ),
                            SizedBox(height: 18.h,),
                            Row(
                              children: [
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  ownerController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                        isCompulsory: true,

                                        enabled: true,
                                        textController: addBuyerDetailsController.selectTenantController,
                                        labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                        lablel: 'No Of Installment',
                                        labelWidth: 94,
                                        height: 40,
                                      ),
                                    )),
                                SizedBox(
                                  width: 18.w,
                                ),
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(

                                        isCompulsory: true,
                                        enabled: true,
                                        lablel: 'Date Of Birth',
                                        height: 40,
                                        textController:  addBuyerDetailsController.selectTenantController,
                                        labelWidth: 81,
                                        labelColor:addBuyerDetailsController.selectTenantLabelColor ,
                                        suffixIcon:
                                        'asset/icon/calendar.png',
                                        suffixIconTab: () async {
                                          DateTime now =
                                          DateTime.now();
                                          DateTime? newDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: now,
                                              firstDate:
                                              DateTime(1900),
                                              lastDate:
                                              DateTime(2023));
                                          DateFormat.yMd().format(newDate!);
                                          setState(() {
                                            //  tenantController.dateOfBirthController.text= DateFormat.yMd().format(newDate!);
                                          });
                                          print(newDate);
                                        },
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 18.h,),
                            Focus(
                              onFocusChange: (hasFocus) {
                                //  ownerController.isClickedCompanyDetails=true;
                                setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                              },
                              child: AppFormTextField(

                                isCompulsory: true,
                                enabled: true,
                                textController: addBuyerDetailsController.selectTenantController,
                                labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                lablel: 'Amount For Installment',
                                labelWidth: 94,
                                height: 40,
                              ),
                            ),
                            SizedBox(height: 18.h,),
                            Focus(
                              onFocusChange: (hasFocus) {
                                //  ownerController.isClickedCompanyDetails=true;
                                setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                              },
                              child: AppFormTextField(
                                isCompulsory: true,

                                enabled: true,
                                textController: addBuyerDetailsController.selectTenantController,
                                labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                lablel: 'Do you want to adjustment this picture',
                                labelWidth: 94,
                                height: 40,
                              ),
                            ),
                            SizedBox(height: 18.h,),
                            Row(
                              children: [
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  ownerController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor = hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                        isCompulsory: true,

                                        enabled: true,
                                        textController: addBuyerDetailsController.selectTenantController,
                                        labelColor: addBuyerDetailsController.selectTenantLabelColor,
                                        lablel: 'Enter Adjustment Price',
                                        labelWidth: 94,
                                        height: 40,
                                      ),
                                    )),
                                SizedBox(
                                  width: 18.w,
                                ),
                                Flexible(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        //  tenantController.isClickedCompanyDetails=true;
                                        setState(() =>addBuyerDetailsController.selectTenantLabelColor= hasFocus ? AppColors.purPleGradientOneColor : AppColors.textFieldDefaultColor);
                                      },
                                      child: AppFormTextField(
                                          isCompulsory: true,

                                          enabled: true,
                                          height: 40,
                                          textController: addBuyerDetailsController.selectTenantController,
                                          labelColor:addBuyerDetailsController.selectTenantLabelColor ,
                                          lablel: 'Balance',

                                          labelWidth: 91),
                                    ))
                              ],
                            ),
                            SizedBox(height: 18.h,),
                          ]
                      ),
                    ):SizedBox(),


                  ],
                ),
              ),
              SizedBox(height: 18.h,),
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
          const Expanded(child: SizedBox()),
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
