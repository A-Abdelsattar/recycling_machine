import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomeTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  bool edit;
  final IconData icon;
  final TextEditingController controller;

  CustomeTextField(
      {required this.label,
        this.isPassword = false,
        this.edit=true,
        required this.controller,
        required this.icon});

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(

        validator: (value){
          if(value!.isEmpty){
            return '${widget.label} must not be empty';
          }

        },
        enabled: widget.edit,
        controller: widget.controller,
        keyboardType: widget.edit?!widget.isPassword?TextInputType.emailAddress:TextInputType.name:TextInputType.none,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
               BorderSide(color: AppColors.kMainColor, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            prefixIcon: Icon(
              widget.icon,
              color: AppColors.kMainColor,
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: showPassword
                    ? Icon(
                  Icons.visibility,
                  color: AppColors.kMainColor,
                )
                    : Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                ))
                : Text(''),
            border: OutlineInputBorder(),
            label: Text(
              widget.label,
              style: TextStyle(color: AppColors.kMainColor),
            )),
        cursorColor: AppColors.kMainColor,
        cursorHeight: 25.h,
        cursorWidth: 3.w,

        cursorRadius: Radius.circular(20),
        obscureText: widget.isPassword && showPassword,
      ),
    );
  }
}
