import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/map2.jpg').image,
                fit: BoxFit.cover),
          ),
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.white),
              child: Center(
                child: Text(
                  'BIN LOCATOR',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: TextFormField(
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'EX) STATE COLLEGE, PA',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search,color: AppColors.kMainColor,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),


                ),
              ),
            ),
            SizedBox(height: 390.h),
            Align(
              alignment: Alignment.bottomCenter,
                child: Button()),
          ],
        )
      ],
    );
  }
}
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:180.w,
      decoration: BoxDecoration(
        color: AppColors.kMainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Center(
          child: Text('LOCATE NEAREST',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      ) ,
    );
  }
}