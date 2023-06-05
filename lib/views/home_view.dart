import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycling_machine/constants/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  // late final TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.asset(
              'assets/images/home.png',
              height: 40.h,
            ),
            SizedBox(height: 10.h,),
            Text(
              'points help you get gifts',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp),
            ),
              SizedBox(height: 20.h,),

              Text(
              'My Points:',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp),
            ),
            Text(
              '2000 points',
              style: TextStyle(fontSize: 26.sp),
            ),
          ],),
        ),
        Image.asset('assets/images/img.png',height: 80,),
        // TabBar(
        //   controller: _tabController,
        //   tabs:  <Widget>[
        //     Tab(
        //       child: Text('monthly_review',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
        //     ),
        //     Tab(
        //       child: Text('Map',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
        //       ),
        //
        //
        //   ],
        // ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0.h),
              child:const Text('Monthly Review',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0.w,vertical: 20.h),
          child: Container(
            width: double.infinity,
            height: 230.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color:Colors.white,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 10.w),
                  child: Text('Your monthly overview',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Container(
                    height:150.h,
                    width: 180.w,
                    color:const Color(0xffE0CC61),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/coins.png',height: 80.h,),
                        Text('120',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                        Text('points gaines',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                      ],
                    ),
                  ),
                  Container(
                    height: 150.h,
                    width: 130.w,
                    color:const Color(0xff817984),
                    child:Column(
                      children: [
                        SizedBox(height: 5.h,),
                        Image.asset('assets/images/kg.png',height: 60.h,),
                        Text(' 0.5 KG\n plastic\n donated',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20.sp),)
                      ],
                    ),
                  )
                ],),
              ],
            ),
          ),
        ),
            Center(child: Button()),
      ]),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:100,
      decoration: BoxDecoration(
        color: AppColors.kMainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text('GOT IT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      ) ,
    );
  }
}
