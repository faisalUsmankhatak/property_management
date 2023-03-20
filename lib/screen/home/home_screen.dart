

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/bottom_bar_controller.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/owner_controller.dart';
import '../../controller/rent_add_property_Controller.dart';
import '../../controller/rental_sales_controller.dart';
import '../rental_management/add_owner_screen.dart';
import '../rental_management/add_property_screen.dart';
import '../rental_management/rent_screen.dart';
import '../rental_management/comments_list.dart';
import '../rental_management/currency_listing.dart';
import '../rental_management/invoices_listing.dart';
import '../rental_management/rental_management_screen.dart';
import '../rental_management/reports_listing_screen.dart';
import '../rental_management/services_listing.dart';
import '../sales_management/agreement_listing.dart';
import '../sales_management/on_installment_listing.dart';
import '../sales_management/sales_add_property_screen.dart';
import '../sales_management/sales_property_listing_screen.dart';
import '../sales_management/sold_property_listing.dart';
import '../rental_management/add_tenant_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.find();
  RentAddPropertyController propertyController=Get.put(RentAddPropertyController());
  OwnerController ownerController=Get.put(OwnerController());
  DashboardController dashboardController = Get.find();
  BottomBarController bottomBarController = Get.find();
 final RentalSalesController rentalSalesController=Get.put(RentalSalesController());
Color moreOption=AppColors.blackColor;
  List<String> propertyType=['For Sale','For Rent','For Sale','For Sale','For Rent','For Sale',];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDF0F6),
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
              borderSide: BorderSide(color:Color(0xffEDF0F6) )
            ),
            leading: Container(
              width: 25.w,
              height: 25.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/icon/appbarIcon.png"))),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 17.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello!\nFaisal Usman",
                        style: TextStyle(
                            color: AppColors.homePageTextColor,fontFamily: 'Roboto-Black',
                            fontSize: 30.sp)),
                    Text("Manage your property Sale,\nPurchase and Rent",
                        style: AppStyles.subTitleStyle()),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        GridViewList(0,context),
                        SizedBox(
                          width: 10.w,
                        ),
                        GridViewList(1,context),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Card(
                  elevation: 3.sp,
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('asset/icon/filter.png'))),
                        ),
                        hintText: 'Search Property',
                        hintStyle: AppStyles.formLabelStyle(),
                        prefixIcon: Padding(
                          padding:  EdgeInsets.all(12.sp),
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              gradient:  LinearGradient(
                                colors: [
                                  Color(0xff7A539C),
                                  Color(0xff7742E0)
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft
                              ),
                                color: AppColors.blueColor,
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('asset/icon/search.png'))),
                          ),
                        ),
                        fillColor: AppColors.whiteColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.whiteColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.whiteColor,
                        ))),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text("Recently add",
                    style:
                        TextStyle(fontSize: 20.sp, color: AppColors.textFieldDefaultColor,fontFamily: 'Roboto-Black')),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Card(
                elevation: 5.sp,
                margin: EdgeInsets.zero,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topRight:Radius.circular( 30.sp),topLeft:Radius.circular( 30.sp) ),
                    borderSide: BorderSide(color: AppColors.whiteColor)),
                child: Container(
                  height: 220.h,
                  width: Get.width,
padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.sp),
                          topLeft: Radius.circular(30.sp))),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                         padding: EdgeInsets.zero,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.sp,
                              backgroundImage:
                                  AssetImage('asset/icon/human.png'),
                            ),
                            title: Text("G15 Property -Plot",style: AppStyles.titleStyle()),
                            subtitle:Row(
                              children: [
                                Text("03325156429",style: AppStyles.titleStyle()),
                                SizedBox(width: 10.w,),
                                Text(propertyType[index],style: AppStyles.titleStyle(),)
                              ],
                            ),
                            onTap: () {
                              Get.to(RentalManagementScreen(propertyType: propertyType[index],));
                            },
                            trailing: Icon(Icons.arrow_forward,color: AppColors.textFieldDefaultColor),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                        return horizontalDriver();
                  },),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget GridViewList(int index,BuildContext context) {
    //print(map['Sales Management']);
    return Expanded(
      child: Container(
        height: 170.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              homeController.GrideViewData[index]['linearGradientColor1'],
              homeController.GrideViewData[index]['linearGradientColor2'],
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(20.sp)),
        child: Stack(
          children: [
            Positioned(
              top: homeController.GrideViewData[index]['title'] ==
                      "Sales Management"
                  ? 14.h
                  : 5.h,
              left: homeController.GrideViewData[index]['title'] ==
                      "Sales Management"
                  ? 8.w
                  : 0.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    homeController.GrideViewData[index]['ImagePath'],
                    height: homeController.GrideViewData[index]['title'] ==
                            "Sales Management"
                        ? 55.h
                        : 100.h,
                    width: homeController.GrideViewData[index]['title'] ==
                            "Sales Management"
                        ? 51.w
                        : 83.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: homeController.GrideViewData[index]['title'] ==
                            "Sales Management"
                        ? 33.w
                        : 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: homeController.GrideViewData[index]['title'] ==
                                "Sales Management"
                            ? 0.h
                            : 12.h,
                        left: 19.w),
                    child: Obx(
                      () => Container(
                        width: 37.w,
                        height: 37.h,
                        decoration: BoxDecoration(
                            color: homeController.boxColor[index],
                            shape: BoxShape.circle),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onPanDown: (details) {
                            if (homeController.GrideViewData[index]['title'] ==
                                'Rent Management') {
                              homeController.boxColor[index] =
                                  AppColors.whiteColor;
                              homeController.GrideViewData[index]
                                  ['popupIconColor'] = Color(0xff7742E0);
                            } else {
                              homeController.boxColor[index] =
                                  AppColors.whiteColor;
                              homeController.GrideViewData[index]
                                  ['popupIconColor'] = Color(0xffD45757);
                            }
                          },
                          child: PopupMenuButton(
                              padding: EdgeInsets.zero,
                              // constraints: BoxConstraints(maxWidth: 170.sp,minWidth:137.sp ),
                              shape: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: BorderRadius.circular(10.sp),
                                  borderSide:
                                      BorderSide(color: AppColors.whiteColor)),
                              offset: homeController.GrideViewData[index]
                                          ['title'] ==
                                      "Sales Management"
                                  ? Offset(-10.sp, 40.sp)
                                  : Offset(-140.sp, 40.sp),
                              iconSize: 36.sp,
                              // position: PopupMenuPosition.under,

                              color: AppColors.whiteColor,
                              icon: Image.asset(
                                'asset/icon/rentpop.png',
                                color: homeController.GrideViewData[index]
                                    ['popupIconColor'],
                              ),
                              onCanceled: () {
                                if (homeController.GrideViewData[index]
                                        ['title'] ==
                                    'Rent Management') {
                                  homeController.boxColor[index] =
                                      Color(0xff7742E0).withOpacity(0.7);
                                  homeController.GrideViewData[index]
                                      ['popupIconColor'] = AppColors.whiteColor;
                                } else {
                                  homeController.boxColor[index] =
                                      Color(0xffD45757).withOpacity(0.3);
                                  homeController.GrideViewData[index]
                                      ['popupIconColor'] = AppColors.whiteColor;
                                }
                              },
                              onSelected: (val) {
                                print("onsalected");
                                //  homeController.isClickPopupButton.value = true;
                                navigat(
                                    val.toString(),
                                    homeController.GrideViewData[index]
                                        ['title'],context);
                              },
                              itemBuilder: (BuildContext context) {
                                return homeController.GrideViewData[index]
                                            ['title'] ==
                                        'Rent Management'
                                    ? homeController.rent.map((e) {
                                  if(e=='More Options'){
moreOption=AppColors.purPleGradientTwoColor;
                                  }else{
                                    moreOption=AppColors.blackColor;
                                  }
                                        return PopupMenuItem(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          value: e,
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(e,style: AppStyles.titleStyle()),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              horizontalDriver()
                                            ],
                                          ),
                                        );
                                      }).toList()
                                    : homeController.sale.map((e) {

                                        return PopupMenuItem(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          value: e,
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(e,style: AppStyles.titleStyle()),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              horizontalDriver()
                                            ],
                                          ),
                                        );
                                      }).toList();
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 70.h,
                left: 18.w,
                right: 18.w,
                child: Text(
                  homeController.GrideViewData[index]['title'],
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.whiteColor,
                     fontFamily: 'Roboto-Black'),
                )),
            Positioned(
                top: 140,
                left: 18.w,
                right: 18.w,
                child: Text(
                  homeController.GrideViewData[index]['subtitle'],
                  style:
                      TextStyle(color: AppColors.whiteColor, fontSize: 12.sp,fontFamily: 'Roboto-Black'),
                ))
          ],
        ),
      ),
    );
  }

  Widget horizontalDriver(){
    return
      Container(

        height: 0.6.h,
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

  void navigat(String val, String title,BuildContext context) {

    if (val == "Add Property" && title == "Rent Management") {
      homeController.isRentPrimaryColor.value=false;
      Get.to( const AddPropertyScreen());
      print("rent add property");
    } else if (val == 'Properties List' && title == 'Rent Management') {
      homeController.isRentPrimaryColor.value=false;

      Get.to(RentalManagementScreen(propertyType: 'Rent',));
    }
    else if (val == 'Add Owner' && title == 'Rent Management') {
      homeController.isRentPrimaryColor.value=false;
      Get.to(const AddOwnerScreen());
    }else if (val == 'Add Tenants' && title == 'Rent Management') {
      homeController.isRentPrimaryColor.value=false;
      Get.to(const AddTenantScreen());
    }
    else if (val == 'Add Rent' && title == 'Rent Management') {
      homeController.isRentPrimaryColor.value=false;
      Get.to(const RentScreen());
    }
    else if (val == "Add Property" && title == "Sales Management") {
      homeController.isRentPrimaryColor.value=true;
      Get.to( const SalesAddPropertyScreen());

    }
    else if (val == "On Installment" && title == "Sales Management") {
      homeController.isRentPrimaryColor.value=true;
      Get.to(  OnInstallmentListing());

    } else if (val == 'Properties List' && title == 'Sales Management') {
      homeController.isRentPrimaryColor.value=true;
      Get.to( SalesManagementScreen());

    }
    else if (val == "Sold Property" && title == "Sales Management") {
      homeController.isRentPrimaryColor.value=true;
      Get.to(  SoldPropertyListing());

    }
    else if (val == 'More Options' && title == "Rent Management") {
      bootomSheet(context);

    } else if (val == 'Agreement' && title == "Sales Management") {
      homeController.isRentPrimaryColor.value=true;
     Get.to(AgreementListing());

    }
  }
  void navigate(String value){
    if(value=='Services'){
      Get.to( ServicesListing());
    }else if(value=='Reports'){
      Get.to(ReporstListingScreen());
    }
    else if(value=='Invoices'){
      Get.to(InvoicesListing());
    }
    else if(value=='currency'){
      Get.to(CurrencyListing());
    } else if(value=='Comments'){
      Get.to(CommentsList());
    }
  }
  Future<void>  bootomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),topLeft: Radius.circular(20.sp))),
      builder: (BuildContext context) {
        return Container(
           //height: 100.h,

          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),topLeft: Radius.circular(20.sp))
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
SizedBox(
  height: 10.h,
),
Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    SizedBox(),
    Center(
      child:   Container(
        width: 40.w,
        height: 2.h,
        decoration: BoxDecoration(
            color: homeController.isRentPrimaryColor.value?AppColors.redGradientOneColor:AppColors.purPleGradientTwoColor
        ),
      ),
    ),
    InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(

        alignment: Alignment.center,
        child: Icon(Icons.close,size: 25.sp),
      ),
    ),
  ],
),


              SizedBox(height: 25.h,),
ListView.separated(
    shrinkWrap: true,
    itemCount: homeController.list.length,
    itemBuilder: (context, index) {
  return ListTile(
    onTap: (){
      navigate(homeController.list[index]);
    },
  title:Text(homeController.list[index],style: AppStyles.labelValueStyle()) ,
  );
}, separatorBuilder: (BuildContext context, int index) {
      return horizontalDriver();
},),


            ],
          ),
        );
      },
    );

  }

}
