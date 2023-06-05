import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:recycling_machine/constants/app_colors.dart';

class ResultQRView extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ResultQRView({super.key, required this.code,required this.closeScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          QrImage(data: code,size: 150,version: QrVersions.auto,),

          Text(code),
          SizedBox(
            width: MediaQuery.of(context).size.width-100,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kMainColor,
              ),
              onPressed: (){},
              child: const Text('Copy',style: TextStyle(fontSize: 16,letterSpacing: 1,color: Colors.black),),
            ),
          )
        ],
      ),
    );
  }
}
