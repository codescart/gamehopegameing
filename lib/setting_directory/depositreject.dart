import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopegamings/Api_controller/deposit_controller.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/contant/text_constant.dart';

class depositlreject extends StatefulWidget {
  final  deposit_history data;
  depositlreject( {required this.data,});


  @override
  State<depositlreject> createState() => _depositlrejectState();
}

class _depositlrejectState extends State<depositlreject> {




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
            withdrawlrejectRDE,
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
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    physics: const BouncingScrollPhysics(),
                    child: widget.data.remark == null
                        ? Center(child: CircularProgressIndicator())
                        : HtmlWidget(
                      '${widget.data.remark}',
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
