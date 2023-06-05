
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';


class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback function;

  MainButton({required this.label, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.kMainColor,
        ),
        child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white,fontSize: 20),
            )),
      ),
    );
  }
}
