import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopegamings/contant/Api_constant.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/contant/text_constant.dart';
import 'package:http/http.dart' as http;

class termcondition extends StatefulWidget {
  const termcondition({Key? key}) : super(key: key);

  @override
  State<termcondition> createState() => _termconditionState();
}

class _termconditionState extends State<termcondition> {
  var data;
  Future<void> termsCondition() async {
    print('aaaaaaa');
    final response = await http.get(Uri.parse(Apiconst.T_c));
    final datas = jsonDecode(response.body);
    print('aaaaaaaaaaaa');
    print(datas);
    if (datas['error'] == '200') {
      setState(() {
        data = datas['data'];
      });
      print(data);
    } else {}
  }

  @override
  void initState() {
    termsCondition();
    // TODO: implement initState
    super.initState();
  }

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
            Termcondition,
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
                padding:  EdgeInsets.all(8.0),
                physics:  BouncingScrollPhysics(),
                child: data == null
                    ? Center(child: CircularProgressIndicator())
                    : HtmlWidget(
                        data[0]['termandcondition'].toString(),
                      ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
