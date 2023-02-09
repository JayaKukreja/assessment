import 'package:assessment/constants.dart';
import 'package:assessment/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  DateTime? initialDate = DateTime.now();
  List<String> items = ["Gender", "Male", "Female", "Others"];
  String dropdownvalue = 'Gender';
  int genderIndex = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  // initstate() {

  //   print(MediaQuery.of(context).size.width);
  //   print(MediaQuery.of(context).size.height);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              // color: Colors.white,
              width: 5,
              height: 5,
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  width: 250.w,
                  child: Text(
                    "Let's create your Profile",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Image.asset("assets/example", height: 300.h),
              SizedBox(
                height: 10.h,
              ),
              MyAppTheme.CustomTextField(
                  readonly: false,
                  controller: nameController,
                  icon: Icons.person,
                  labeltext: "Full Name"),
              // TextField(),
              // TextField(),
              // TextField(),
              // TextField(),
              SizedBox(
                height: 15.h,
              ),
              MyAppTheme.CustomTextField(
                controller: dobController,
                readonly: true,
                icon: Icons.date_range,
                labeltext: "Date of Birth",
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await showDatePicker(
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now())
                      .then((value) {
                    initialDate = value;
                    if (value != null) {
                      String? months, days;
                      months = value.month.toString().length == 1
                          ? "0$value.month"
                          : value.month.toString();
                      days = value.day.toString().length == 1
                          ? "0$value.day"
                          : value.day.toString();
                      setState(() {
                        dobController.text = "$days-$months-${value.year}";
                      });
                    } else {
                      initialDate = DateTime.now();
                    }
                  });
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 15.h, bottom: 15.h, left: 20.w, right: 8.w),
                        // errorStyle:
                        // TextStyle(color: Colors.redAccent, fontSize: 10.sp),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12.r),
                        //   borderSide: const BorderSide(
                        //       width: 1,
                        //       style: BorderStyle.solid,
                        //       color: Colors.red),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.w),
                        ),
                      ),
                      isEmpty: items == '',
                      child: DropdownButtonHideUnderline(
                        child: SizedBox(
                          // height: 25.h,
                          child: DropdownButton<String>(
                            // hint: Text("gender"),
                            value: dropdownvalue,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                genderIndex = items.indexOf(newValue);
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 35.sp,
                              color: primaryColor,
                            ),
                            items: items.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: (value == "Gender")
                                          ? Colors.grey
                                          : Colors.black,
                                      fontWeight: (value == "Gender")
                                          ? FontWeight.normal
                                          : FontWeight.bold),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              MyAppTheme.CustomTextField(
                  readonly: false,
                  controller: cityController,
                  icon: Icons.location_city,
                  labeltext: "Job City",
                  onChanged: (p0) => Navigator.pushNamed(context, '/jobCity'),
                  hintText: 'Job City')
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBar(),
    );
  }
}
