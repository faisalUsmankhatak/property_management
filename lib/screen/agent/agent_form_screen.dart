import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/agent_controller.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';

class AddNewAgentScreen extends StatelessWidget {
  AddNewAgentScreen({Key? key}) : super(key: key);
  String defaultValue = "Customer";

  List<String> customerLIst = ['Customer', "Faisal", "Kamal", "Akmal"];
  final _formKey = GlobalKey<FormState>();
  AgentController agentController=Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              Container(
                height: 48.h,
                color: AppColors.greenColor,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back,
                          color: AppColors.whiteColor, size: 20),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "Add New Agent",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: 20.h,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    AppFormTextField(
                      isCompulsory: false,
                        lablel: "Full Name *",
                        height: 10.sp,
                        validation: MultiValidator([
                          RequiredValidator(errorText: 'Full is required'),
                          MinLengthValidator(4,
                              errorText:
                                  'Full Name must be at least 8 Charecters long'),
                        ])),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppFormTextField(
                      lablel: "Email *",
                      isCompulsory: false,
                      height: 10.sp,
                      validation: MultiValidator([
                        RequiredValidator(errorText: "Email Required"),
                        EmailValidator(errorText: 'enter a valid email address')
                      ]),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppFormTextField(
                            lablel: "Mobile *",
                            isCompulsory: false,
                            height: 10.sp,
                            typeKeyboard: TextInputType.phone,
                            validation: MultiValidator([
                              RequiredValidator(errorText: "Phone Requird")
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        Expanded(
                            child: AppFormTextField(
                          lablel: "Phone",
                          height: 10.sp,
                          typeKeyboard: TextInputType.phone, isCompulsory: false,
                        )),
                      ],
                    ),
                    // SizedBox(
                    //   height: 24.h,
                    // ),
                    // DropdownButtonFormField<String>(
                    //   isDense: true,
                    //   value: defaultValue,
                    //   decoration: InputDecoration(
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(color: AppColors.greenColor)),
                    //       contentPadding: EdgeInsets.all(10.sp),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    //         borderSide:
                    //             BorderSide(width: 2.w, color: Colors.black12),
                    //       )),
                    //   items: customerLIst.map((e) {
                    //     return DropdownMenuItem<String>(
                    //       value: e,
                    //       child: Text(e, style: AppStyles.formTextStyle()),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     // setState(() {
                    //     //   defaultValue = value!;
                    //     // });
                    //   },
                    // ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppFormTextField(lablel: "NIC Number *", height: 10.sp, isCompulsory: false,),
                    SizedBox(
                      height: 24.h,
                    ),
                    Obx(()=>
                       AppFormTextField(
                         isCompulsory: false,
                        textController: agentController.projectController.value,
                          lablel: "Profile Picture *",
                          height: 10.sp,
                          suffixIcon: "asset/icon/uploadfile.jpg",
                      suffixIconTab:agentController.getProfileImage),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppFormTextField(isCompulsory: false,lablel: "Details", height: 10.sp),
                    SizedBox(
                      height: 24.h,
                    ),
                    FormButton(
                        buttonText: "Add new project",
                        height: 55,
                        radius: 100,
                        onTap: () {},
                        bodyColor: AppColors.greenColor)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
