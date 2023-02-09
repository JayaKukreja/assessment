import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class MyAppTheme {
static Widget CustomTextField(
      {TextEditingController? controller,
      required bool readonly,
      String? labeltext,
      Widget? prefixIcon,
      void Function(String)? onChanged,
      IconData? icon,
      void Function(String)? onSubmitted,
      dynamic onTap, 
      String? hintText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(onSubmitted: onSubmitted,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        controller: controller,
        onChanged: onChanged,
        readOnly: readonly,
        
        onTap: onTap,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            // labelStyle: TextStyle(fontWeight: FontWeight.bold),

            labelText: labeltext,
            labelStyle:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
            suffixIcon: Icon(
              icon,
              color: primaryColor,
              size: 30.sp,
            ),prefixIcon: prefixIcon,
            // icon:
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1.w,
              color: Colors.grey,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1.w,
              color: Colors.grey,
            ))),
      ),
    );
  }
}
