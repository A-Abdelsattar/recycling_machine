
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../constants/app_colors.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({Key? key}) : super(key: key);

  @override
  State<QRScannerView> createState() => _QRScannerViewState();
}

class _QRScannerViewState extends State<QRScannerView> {
  bool isScanCompleted=false;
  void closeScreen(){
    isScanCompleted=false;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 50,),
          Text('SCAN',style: TextStyle(color: AppColors.kMainColor,fontWeight: FontWeight.bold,fontSize: 30)),
          SizedBox(height: 20.h,),
          Expanded(child: MobileScanner(
              onDetect: ((barcode) {
                if(!isScanCompleted){
                  String code=barcode.raw??'---';
                  isScanCompleted=true;
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultQRView(closeScreen: closeScreen,code: code,)));
                }
          })),),
          SizedBox(height: 30.h,),
          Button(),
          SizedBox(height: 60.h,)
        ],
      ),
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
          child: Text('Scan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      ) ,
    );
  }
}
