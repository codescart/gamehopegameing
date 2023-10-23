import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopegamings/Api_controller/deposit_controller.dart';
import 'package:hopegamings/Api_controller/withdrawl_controller.dart';
import 'package:hopegamings/contant/Api_constant.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/contant/color_constant.dart';
import 'package:hopegamings/setting_directory/withdrawlreject.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class widthdrawl_History extends StatefulWidget {
  const widthdrawl_History({Key? key}) : super(key: key);

  @override
  State<widthdrawl_History> createState() => _widthdrawl_HistoryState();
}

class _widthdrawl_HistoryState extends State<widthdrawl_History> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<List<withdrawl_history>>(
          future: qwe(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 700,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(nodatafound),
                      )),
                    ),
                    Text(
                      "No Withdrawl History",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: kBlackColor900
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      snapshot.data![index].status == "0"?
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>withdrawlreject(data:snapshot.data![index])));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: height * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 2),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          color: Colors.grey.withOpacity(0.2))
                                    ]),
                                // color: Color(0xfffe4d6a),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,

                                          children: [
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text(
                                                    "₹ " +
                                                        '${snapshot.data![index].amount}',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 20.sp)),
                                                Text(
                                                  "Withdrawl",
                                                  style: TextStyle(
                                                      fontFeatures: [
                                                        FontFeature.superscripts()
                                                      ],
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 10.sp),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text( '${snapshot.data![index].date}',
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 11.sp),),
                                                Text(
                                                  "Date",
                                                  style: TextStyle(
                                                      fontFeatures: [
                                                        FontFeature.superscripts()
                                                      ],
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 8.sp),
                                                ),
                                              ],
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text( '${snapshot.data![index].time}',
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 11.sp),),
                                                Text(
                                                  "Time",
                                                  style: TextStyle(
                                                      fontFeatures: [
                                                        FontFeature.superscripts()
                                                      ],
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 8.sp),
                                                ),
                                              ],
                                            ),

                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text(
                                                    snapshot.data![index].status == '0'
                                                        ? 'Reject '
                                                        : snapshot.data![index].status ==
                                                        '1'
                                                        ? 'Pending '
                                                        : 'Success ',
                                                    style: TextStyle(
                                                        color: snapshot.data![index]
                                                            .status ==
                                                            '0'
                                                            ? Colors.red
                                                            : snapshot.data![index]
                                                            .status ==
                                                            '1'
                                                            ? Colors.orangeAccent
                                                            : Colors.green,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 12.sp)),
                                                Text(
                                                  "status",
                                                  style: TextStyle(
                                                      fontFeatures: [
                                                        FontFeature.superscripts()
                                                      ],
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 9.sp),
                                                ),
                                              ],
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text("${snapshot.data![index].payout}",
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 12.sp)),
                                                Text(
                                                  "  payout",
                                                  style: TextStyle(
                                                      fontFeatures: [
                                                        FontFeature.superscripts()
                                                      ],
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 8.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(8, 0, 15, 0),
                                child: Container(
                                  height: 20,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                     bottomRight: Radius.circular(7),
                                        bottomLeft: Radius.circular(7)
                                      ),
                                    color: appbvar

                                    ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text('Your Request is rejected',style: GoogleFonts.aclonica(
                                          textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),),
                                        Spacer(),
                                        Text('VIEW →',style: GoogleFonts.aclonica(
                                          textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),),
                                      ],
                                    ),
                                  ),

                                ),
                              )
                            ],
                          ),
                        ),
                      ):
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: snapshot.data![index].status == "0"
                                ? Colors.red
                                : snapshot.data![index].status == "1"
                                    ? Colors.orangeAccent
                                    : Colors.green,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                        // color: Color(0xfffe4d6a),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                            "₹ " +
                                                '${snapshot.data![index].amount}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20.sp)),
                                        Text(
                                          "Withdrawl",
                                          style: TextStyle(
                                              fontFeatures: [
                                                FontFeature.superscripts()
                                              ],
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.end,
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Text( '${snapshot.data![index].date}',
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11.sp),),
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                              fontFeatures: [
                                                FontFeature.superscripts()
                                              ],
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8.sp),
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Text( '${snapshot.data![index].time}',
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11.sp),),
                                        Text(
                                          "Time",
                                          style: TextStyle(
                                              fontFeatures: [
                                                FontFeature.superscripts()
                                              ],
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8.sp),
                                        ),
                                      ],
                                    ),

                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                            snapshot.data![index].status == '0'
                                                ? 'Reject '
                                                : snapshot.data![index].status ==
                                                        '1'
                                                    ? 'Pending '
                                                    : 'Success ',
                                            style: TextStyle(
                                                color: snapshot.data![index]
                                                            .status ==
                                                        '0'
                                                    ? Colors.red
                                                    : snapshot.data![index]
                                                                .status ==
                                                            '1'
                                                        ? Colors.orangeAccent
                                                        : Colors.green,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp)),
                                        Text(
                                          "status",
                                          style: TextStyle(
                                              fontFeatures: [
                                                FontFeature.superscripts()
                                              ],
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9.sp),
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Text("${snapshot.data![index].payout}",
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp)),
                                        Text(
                                          "  payout",
                                          style: TextStyle(
                                              fontFeatures: [
                                                FontFeature.superscripts()
                                              ],
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }

  Future<List<withdrawl_history>> qwe() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response =
        await http.get(Uri.parse(Apiconst.Withdrawl_histry + 'user_id=$userid'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      print(response);
      print(jsonData);
      print('ttttttttttttttttt');
      return jsonData.map((item) => withdrawl_history.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
