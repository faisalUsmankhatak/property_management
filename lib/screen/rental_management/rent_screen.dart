import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/rent_controller.dart';
import '../../widget/drop_down_field.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';
class RentScreen extends StatefulWidget {
  const RentScreen({Key? key}) : super(key: key);

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  RentController rentController= Get.put(RentController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  FormButton(buttonText: 'Add Rent', width: 310.w, radius: 100.sp,borderColor: AppColors.greyColor,bodyColor: AppColors.greyColor),
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
            child: Image.asset('asset/icon/back.png',color: AppColors.purPleGradientTwoColor),
          ),
        ),
        title: Text("Add Rent",
            style: AppStyles.appBarStyle()),
      ),
       body:SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 24.w),
           child: Column(
             children: [
               SizedBox(
                 height: 28.h,
               ),

               Row(
                 children: [
                   Flexible(
                       child: GestureDetector(
                           onPanDown: (details){
                             setState(() {
                                rentController.isChangeTenantDropDownIcon=true;
                             });

                           },
                           child:DropDownField(label:'Select Tenant',labelWidth: 96 ,menu: rentController.tenantName,
                             isChangeIcon: rentController.isChangeTenantDropDownIcon,
                             onChange:(value) {
                            rentController.selectTenantController.text=value.toString();


                             setState(() {
                               rentController.isChangeTenantDropDownIcon=false;
                             });
                           }, )
                          //  dropDown("Select Tenant",rentController.tenantName,0,(value) {
                          // print(value.toString());
                          //  //  setOnchangeValue();
                          //  },79)
                       )

                   ),
               SizedBox(width: 18.w,),
                   //rentController.dropDownSelectedValue[0] == 'Company'
                        Flexible(
                     child:GestureDetector(
                         onPanDown: (details){



                           setState(() {
                              rentController.isChangeSelectPropertyDropDownIcon=true;
                           });
                         },
                         child:DropDownField(label:'Select Property' ,labelWidth: 105,menu: rentController.tenantName,
                             isChangeIcon: rentController.isChangeSelectPropertyDropDownIcon,
                             onChange: (value) {
                           rentController.selectPropertyController.text=value.toString();

                           setState(() {
                             rentController.isChangeSelectPropertyDropDownIcon=false;

                           });
                         }, )

                     ),

                   )

                 ],
               ),
               SizedBox(height: 18.h,),
               Container(
                 width: double.infinity,
                 //height:tenantController.isHiddenContactPersonDetails? 290.h:36.5.h,

                 // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                 // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                 decoration: BoxDecoration(

                     borderRadius: BorderRadius.circular(5.sp),
                     border: Border.all(color:rentController.isHiddenRentDetails?AppColors.purPleGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                 child: Column(
                   children: [
                     InkWell(
                       onTap:(){
                         setState(() {
                           rentController
                               .isHiddenRentDetails =! rentController
                               .isHiddenRentDetails;
                         });
                       },
                       child:    filterHidding('Rent Details',rentController
                           .isHiddenRentDetails),

                     ),

                     rentController
                         .isHiddenRentDetails?         Container(
                       width: double.infinity,
                       padding: EdgeInsets.symmetric(horizontal: 10.w),
                       //  height: tenantController.isHiddenContactPersonDetails? 240.h:37.5.h,
                       child: Column(
                         children: [
                           SizedBox(
                             height: 20.h,
                           ),
                           AppFormTextField(
                             isCompulsory: true,
                             enabled: true,
                             textController: rentController.agreementStartController,
                             lablel: 'Agreement Start',
                             height: 40,
                             //textController:  ownerController.dateOfBirthController,
                             labelWidth: 108,

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
                                   DateTime(2024));
                               DateFormat.yMd().format(newDate!);
                               setState(() {
                                   rentController.agreementStartController.text= DateFormat.yMd().format(newDate);
                               });

                             },
                           ),
                           SizedBox(
                             height: 18.w,
                           ),
                           AppFormTextField(
                             isCompulsory: true,
                             enabled: true,
                             height: 40,
                             //textController: ownerController.companyLastNameController,
                             lablel: 'Rent Payment term',
                             labelWidth: 120,

                           ),
                           SizedBox(
                             height: 18.h,
                           ),
                           AppFormTextField(
                             isCompulsory: true,
                             enabled: true,
                             height: 40,
                             //textController: ownerController.companyLastNameController,
                             lablel: 'Rent Amount',
                             labelWidth: 88,

                           ),
                           SizedBox(
                             height: 18.h,
                           ),
                           AppFormTextField(
                             isCompulsory: true,
                             enabled: true,
                             lablel: 'Rent Due Date',
                             height: 40,
                             textController:  rentController.rentDueDateController,
                             labelWidth: 95,

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
                                   DateTime(2024));
                               DateFormat.yMd().format(newDate!);
                               setState(() {
                                  rentController.rentDueDateController.text= DateFormat.yMd().format(newDate);
                               });
                               print(newDate);
                             },
                           ),
                           SizedBox(
                             height: 18.h,
                           ),
                           AppFormTextField(
                             isCompulsory: true,
                             enabled: true,
                             lablel: 'Period Start',
                             height: 40,
                             textController:  rentController.periodStartController,
                             labelWidth: 81,

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
                                   DateTime(2024));
                               DateFormat.yMd().format(newDate!);
                               setState(() {
                                   rentController.periodStartController.text= DateFormat.yMd().format(newDate);
                               });
                               print(newDate);
                             },
                           ),
                           SizedBox(
                             height: 18.h,
                           ),
                           AppFormTextField(
                             isCompulsory: true,
                             enabled: true,
                             lablel: 'Period End',
                             height: 40,
                             textController:  rentController.periodEndController,
                             labelWidth: 81,

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
                                   DateTime(2024));
                               DateFormat.yMd().format(newDate!);
                               setState(() {
                                  rentController.periodEndController.text= DateFormat.yMd().format(newDate);
                               });
                               print(newDate);
                             },
                           ),
                           SizedBox(
                             height: 18.h,
                           ),
                           GestureDetector(
                               onPanDown: (details){

                                 setState(() {
                                   rentController.isChangeAdvanceRentDropDownIcon =
                                   true;
                                 });
                               },
                               child: DropDownField(label:'Advance Rent',
                                 isChangeIcon: rentController.isChangeAdvanceRentDropDownIcon,
                                 labelWidth: 97,menu: rentController.tenantName,onChange: (value) {
                                 rentController.advanceRentController.text=value.toString();
                                 setState(() {
                                   rentController.isChangeAdvanceRentDropDownIcon =
                                   false;
                                 });

                               },)

                           ),
                           SizedBox(height: 18.w,),
                           //rentController.dropDownSelectedValue[0] == 'Company'
                           GestureDetector(
                               onPanDown: (details){

                                 setState(() {
                                  rentController.isChangeSecurityAmountDropDownIcon=true;
                                 });
                               },
                               child: DropDownField(label:'Security Amount',
                                 isChangeIcon: rentController.isChangeSecurityAmountDropDownIcon,
                                 labelWidth: 113,menu: rentController.tenantName,onChange: (value) {
                                 rentController.securityAmountController.text=value.toString();
                                 setState(() {
                                   rentController.isChangeSecurityAmountDropDownIcon=false;
                                 });
                               },)

                           ),
                           SizedBox(height: 18.h,),

                         ],
                       ),
                     )
                         :SizedBox(),

                   ],
                 ),
               ),
               SizedBox(height: 18.h,),
               Container(
                 width: double.infinity,
                 //height:tenantController.isHiddenContactPersonDetails? 290.h:36.5.h,

                 // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                 // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                 decoration: BoxDecoration(

                     borderRadius: BorderRadius.circular(5.sp),
                     border: Border.all(color:rentController.isHiddenFacilitiesExtras.value?AppColors.purPleGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                 child: Column(
                   children: [
                     InkWell(
                       onTap:(){
                         setState(() {
                           rentController.isHiddenFacilitiesExtras.value =! rentController.isHiddenFacilitiesExtras.value;
                         });
                       },
                       child:    filterHidding('Facilities/Extras',rentController.isHiddenFacilitiesExtras.value),

                     ),

                     rentController.isHiddenFacilitiesExtras.value?         Container(
                       width: double.infinity,
                       padding: EdgeInsets.symmetric(horizontal: 10.w),
                       //  height: tenantController.isHiddenContactPersonDetails? 240.h:37.5.h,
                       child: Column(
                         children: [
                           SizedBox(
                             height: 20.h,
                           ),

                           GestureDetector(
                               onPanDown: (details){

                                 setState(() {
rentController.isChangeServicesDropDownIcon=true;
                                 });
                               },
                               child:DropDownField(label:'Services',
                                 isChangeIcon: rentController.isChangeServicesDropDownIcon,
                                 labelWidth: 69,menu: rentController.services,onChange: (value) {

                                 setOnchangeValue(value);
                                 setState(() {
                                   rentController.isChangeServicesDropDownIcon=false;
                                 });
                               },)

                           ),
                           SizedBox(height: 18.w,),
                           //rentController.dropDownSelectedValue[0] == 'Company'
                           GestureDetector(
                               onPanDown: (details){

                                 setState(() {
                                   // rentController.isChangeDropDownIcon[5] =
                                   // false;
                                 });
                               },
                               child: DropDownField(label:'Services Type',

                                 isChangeIcon:rentController.isChangeServicesTypeDropDownIcon ,
                                 labelWidth: 95,menu: rentController.servicesType,onChange: (value) {

                                 rentController.servicesTypeController.text=value.toString();
                               setState(() {

                               });
                               },)

                           ),
                           SizedBox(height: rentController.servicesTypeController.text=='Chargeable'? 18.h:0.h,),
                           rentController.servicesTypeController.text=='Chargeable'?
                           GestureDetector(
                               onPanDown: (details){

                                 setState(() {
                                   // rentController.isChangeDropDownIcon[6] =
                                   // true;
                                 });
                               },
                               child: DropDownField(label:'Rent',
                                 isChangeIcon: rentController.isChangeRentDropDownIcon,
                                 labelWidth: 79,menu: rentController.rent,onChange: (value) {

                                 rentController.rentController.text=value.toString();
                                 setState(() {

                                 });
                               },)

                           ):const SizedBox(),
                           SizedBox(height:rentController.addServices.length!=0?18.h:0.h ,),
                           ListView.separated(
                             shrinkWrap: true,
                               itemBuilder: (context,index){
                                 return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text('${rentController.addServices[index]}  '
                                         '${rentController.serviceCharges[index]}  '
                                         '${rentController.servicesType[index]}  '
                                         '${rentController.addRent[index]}'),
                                     InkWell(

                                       child: Container(
                                         width: 25.w,
                                         height: 25.h,
                                         decoration: BoxDecoration(
                                           shape: BoxShape.circle,
                                          border: Border.all(width: 1.sp,color: AppColors.redColor)
                                         ),
                                         child: Center(child: Text('X',style: TextStyle(color: AppColors.redColor)),),
                                       ),
                                       onTap: (){
                                       removeRecord(index);
                                       },
                                     )
                                   ],
                                 );
                               },
                               separatorBuilder: (context,index){
                                 return horizontalDriver();
                               },
                               itemCount: rentController.addServices.length),
                           SizedBox(height: 18.h,),
                         ],
                       ),
                     )
                         :SizedBox(),

                   ],
                 ),
               ),
               SizedBox(height: 80.h,)
             ],
           ),
         ),
       ) ,
    ));
  }
  void removeRecord(int index){
    rentController.addServices.removeAt(index);
    rentController.addServicesType.removeAt(index);
    rentController.addRent.removeAt(index);
    // rentController.dropDownController[4].text='';
    // rentController.dropDownController[5].text='';
    // rentController.dropDownController[6].text='';
    // rentController.dropDownController[0].text='';
    // rentController.dropDownController[1].text='';
    //rentController.  isDropDownSelectedValueEmpty[index]=true;
    setState(() {

    });
  }
  Widget horizontalDriver(){
    return
      Container(

        height: 0.5.h,
        decoration:   BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.topRight,
              colors: [
                Colors.black12,Colors.transparent
              ],
              //stops: [0.0, 0.9],
            )
        ),
        //Colors.black12.withOpacity(0.4),

      );
  }





  Widget filterHidding(String title,bool isIconChange,){
    return      Container(
      width: 312.w,
      padding: EdgeInsets.only(left: 5.w,top: 7.h,bottom: 7.h),
      decoration: BoxDecoration(
          color: AppColors.purPleGradientOneColor,
          borderRadius:
          BorderRadius.circular(3.sp),
          gradient:  LinearGradient(
              colors: [Color(0xff7742E0),
                Color(0xff7A539C)

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 7.w),
            child: Text(
              title,
              style: AppStyles
                  .filterLabelStyle(),
            ),
          ),
          const Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
           Expanded(child: SizedBox()),
          Icon(
              isIconChange
                  ? Icons.expand_more
                  : Icons.expand_less,
              color: AppColors.whiteColor),
          SizedBox(
            width: 7.w,
          )
        ],
      ),);
  }
  void setOnchangeValue(value){
    rentController.servicesController.text=value.toString();
   // rentController.labelColor[index]=AppColors.textFieldDefaultColor;
   // rentController.dropDownController[index].text = value.toString();
    if(rentController.servicesController.text!='' &&  rentController.servicesTypeController.text!=''  && rentController.servicesTypeController.text=='Chargeable'&&   rentController.rentController.text!=''){
      rentController.addServices.add(rentController.servicesController.text);
      rentController.addServicesType.add(rentController.servicesTypeController.text);
      rentController.addRent.add(rentController.rentController.text);
    }
    if(rentController.servicesController.text!='' &&  rentController.servicesTypeController.text!=''  && rentController.servicesTypeController.text=='Not Chargeable'&&   rentController.rentController.text!=''){
      rentController.addServices.add(rentController.servicesController.text);
      rentController.addServicesType.add(rentController.servicesTypeController.text);
      rentController.addRent.add('');

    }

    setState(() {
     // rentController.isChangeDropDownIcon[index] = false;
    });
  }
}
