import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopegamings/contant/Api_constant.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/contant/color_constant.dart';
import 'package:hopegamings/contant/text_constant.dart';
import 'package:hopegamings/login_directory/veryfyresetpassword.dart';
import 'package:hopegamings/widgets/ApplogoApi.dart';
import 'package:hopegamings/widgets/custombutton.dart';
import 'package:hopegamings/widgets/flushbar.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

class resetpassphone extends StatefulWidget {
  const resetpassphone({Key? key}) : super(key: key);

  @override
  State<resetpassphone> createState() => _resetpassphoneState();
}

class _resetpassphoneState extends State<resetpassphone> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController resetController = TextEditingController();
  bool _loading = false;

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(appbarbg), opacity: 0.8),
            ),
          ),
          leading: IconButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: Image.asset(
                closebtn,
                height: 70,
                width: 70,
              )),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: Text(
            Resetpassword,
            style: GoogleFonts.aclonica(
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(background)),
          ),
          child: Form(
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              children: [
                Center(
                  child: Container(
                    height: 200.r,
                    width: 230.r,
                    decoration: BoxDecoration(
                      image:     logo==null?DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(applogo))
                          : DecorationImage(
                        fit: BoxFit.fill, image:

                      NetworkImage(Apiconst.imgurl+logo),
                        //
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Card(
                  child: IntlPhoneField(
                    disableLengthCheck: true,
                    controller: resetController,
                    focusNode: focusNode,
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: const Color(0xFF075E54),
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: const EdgeInsets.only(bottom: 13.0),
                      border: InputBorder.none,
                      hintText: Mobilenumber,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                      ),
                    ),
                    languageCode: "IN",
                    initialCountryCode: 'IN',
                    dropdownIcon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.black,
                    ),
                    dropdownTextStyle: (TextStyle(color: Colors.black)),
                    dropdownIconPosition: IconPosition.trailing,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                    },
                  ),
                ),
                SizedBox(height: 50.h,),
                _loading == false
                    ? Center(
                        child: CustomButton(
                          text: Next,
                          textColor: Colors.white,
                          onTap: () async {
                            resetphonenumber(resetController.text);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => veryfyresetpassword(
                            //             resetpass: resetController.text)));
                            // if (_formkey.currentState!.validate()) {
                            //   if (resetController!.length != 10) {
                            //     return ScaffoldMessenger.of(context)
                            //         .showSnackBar(
                            //       const SnackBar(
                            //           content: Text('Enter Valid Number')),
                            //     );
                            //   }
                            //
                            // }
                          },
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            height: 30.r,
                            width: 30.r,
                            child: CircularProgressIndicator(
                                color: custonbtn,
                                strokeWidth: 4,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white)),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
  resetphonenumber(String resetController) async {
    setState(() {
      _loading = true;
    });

    final response = await http.post(
      Uri.parse(Apiconst.Reset_Passwordotp),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "mobile": resetController,
      }),
    );

    var data = jsonDecode(response.body);
    print(data);
    print('aaaaaaaaaaaaaaaaa');
    print('rrrrrrrrrrrrrrrrrr');

    if (data["error"] == "200") {
      setState(() {
        _loading = false;
      });
      final otp = data['otp'];   //  final userid = data['id'];


      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => veryfyresetpassword(resetpass: resetController, pin: otp,)));
    } else {
      setState(() {
        _loading = false;
      });

      Utils.flushBarErrorMessage(data['msg'], context, kBlackColor900);



      print("Error");
    }
  }
}
