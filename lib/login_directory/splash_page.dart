import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hopegamings/contant/Api_constant.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/home_directory/homePage.dart';
import 'package:hopegamings/login_directory/login_page.dart';
import 'package:hopegamings/widgets/ApplogoApi.dart';
import 'package:shared_preferences/shared_preferences.dart';


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _loginState();
}

class _loginState extends State<splash> {
  @override
  void initState() {
    super.initState();

    harsh();

  }

  harsh() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId")??'0';

    print('nnnnnnnnnnnnnnn');
    print(userid);
        Timer(Duration(seconds: 3),
    ()=>userid !='0'?Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => homepage()))
        :Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => login_page()))
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body:Container(
              height: double.infinity.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image:AssetImage(background)
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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

                ],
              ),
            )
        ));
  }
}
