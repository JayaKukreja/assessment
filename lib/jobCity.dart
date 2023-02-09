import 'package:assessment/constants.dart';
import 'package:assessment/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobCity extends StatefulWidget {
  const JobCity({super.key});

  @override
  State<JobCity> createState() => _JobCityState();
}

class _JobCityState extends State<JobCity> {
  String search = "";
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Select Job City",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        spreadRadius: 0)
                  ]),
              child: const Icon(
                Icons.arrow_back,
                color: primaryColor,
                // size: 30,
              )),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextField(
              onSubmitted: (value) {
                search = value;
              },
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              controller: _searchController,
              // onChanged: onChanged,
              // readOnly: readonly,
              // onTap: onTap,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(80, 80, 80, .05),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  // labelStyle: TextStyle(fontWeight: FontWeight.bold),

                  labelText: "Search",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                  // suffixIcon: Icon(
                  //   icon,
                  //   color: primaryColor,
                  //   size: 30.sp,
                  // ),
                  prefixIcon: Icon(Icons.search),
                  // icon:
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
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
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(),
          Expanded(
              child: ListView.builder(
            // itemCount: list.length,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10.h),
                child: Text("Mumbai"),
              );
            },
          ))
        ],
      ),
    );
  }
}
