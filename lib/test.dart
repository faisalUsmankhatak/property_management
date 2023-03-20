import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_management/app_confiq/app_colors.dart';
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      image: DecorationImage(
                        image: NetworkImage('https://cdn.britannica.com/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg')
                      )
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Column(
                    children: [
                     Text('Faisal Usman'),
                      SizedBox(height: 5.h,),
                      Text('Hello Hay')

                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.circular(10.sp)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                    child: Text("My Button"),
                  )
                ],
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.h),
                child: Text('It’s long been a running joke in the Britannica offices that we should compile a list of "best cats”—this is the internet, after all.'),
              ),
              SizedBox(height: 20.h,),
              Container(
                width: double.infinity,
                height: 80.h,
                padding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 15.h),
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(20.sp)
                ),
                child:Row(
                  children: [
                    Expanded(child: Column(children: [
                      Text("54.21k",style: TextStyle(color: AppColors.whiteColor)),
                      SizedBox(height: 5.h,),
                      Text('Hello hay',style: TextStyle(color: AppColors.whiteColor))
                    ],)),
                    Container(
                      width: 1.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey
                      ),
                    ),
                    Expanded(child: Column(children: [
                      Text("54.21k",style: TextStyle(color: AppColors.whiteColor)),
                      SizedBox(height: 5.h,),
                      Text('Hello hay',style: TextStyle(color: AppColors.whiteColor))
                    ],)),
                    Container(
                      width: 1.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                    ),
                    Expanded(child: Column(children: [
                      Text("54.21k",style: TextStyle(color: AppColors.whiteColor)),
                      SizedBox(height: 5.h,),
                      Text('Hello hay',style: TextStyle(color: AppColors.whiteColor))
                    ],)),
                    Container(
                      width: 1.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Faisal',style: TextStyle(fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){}, child: Text('See All'))
                ],
              ),
              SizedBox(height: 8.h,),

Container(
  height: 230.h,
  child:   ListView.separated(

        shrinkWrap: true,
        itemBuilder: (context,index){
  return buildPost();
  }, separatorBuilder: ( context, int index){
    return SizedBox(height: 10.h,);
  }, itemCount: 5),
),
              SizedBox(height: 10.h,),
              Text('Popular From Elly'),
              Container(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                  return Container(
                    width: 190.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://cdn.britannica.com/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg')
                      )
                    ),
                  );
                }, separatorBuilder: (context,index){
                  return SizedBox(width: 8.w,);
                }, itemCount: 10),
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    ));
  }
  Widget buildPost(){
    return   Row(
      children: [
        Container(
          width: 100.w,
          height: 120.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://cdn.britannica.com/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg')
              )
          ),
        ),
        SizedBox(width: 13.w,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('News Policy'),
            SizedBox(height: 15.h,),
            Container(

              width:200.w,
              child: Text(

                'Let’s be real, polydactyl cats give',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Icon(Icons.cancel,size: 20.sp,),
                SizedBox(width: 5.w,),
                Text('Hello'),
                SizedBox(width: 30.w,),
                Icon(Icons.cancel,size: 20.sp,),
                SizedBox(width: 5.w,),
                Text('Hello'),
              ],
            )
            // Row(
            //   children: [
            //     Icon(Icons.cancel,size: 20.sp,),
            //     SizedBox(width: 5.w,),
            //     Text('Hello'),
            //     Expanded(child: SizedBox()),
            //     Icon(Icons.cancel,size: 20.sp,),
            //     SizedBox(width: 5.w,),
            //     Text('Hello'),
            //   ],
            // )
          ],
        )
      ],
    );
  }
}
