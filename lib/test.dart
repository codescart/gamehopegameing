import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopegamings/colorpredication/balance_recharge.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/contant/color_constant.dart';
import 'package:hopegamings/contant/text_constant.dart';
import 'package:hopegamings/setting_directory/aboutus.dart';
import 'package:hopegamings/setting_directory/accountdetails.dart';
import 'package:hopegamings/setting_directory/changePin_page.dart';
import 'package:hopegamings/setting_directory/history.dart';
import 'package:hopegamings/setting_directory/privecypolicy.dart';
import 'package:hopegamings/setting_directory/profile.dart';
import 'package:hopegamings/setting_directory/referandearn.dart';
import 'package:hopegamings/setting_directory/term&condition.dart';
import 'package:hopegamings/setting_directory/withdrawlAmount.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'contant/Api_constant.dart';

class Silver_page extends StatefulWidget {
  const Silver_page({Key? key}) : super(key: key);

  @override
  State<Silver_page> createState() => _Silver_pageState();
}

class _Silver_pageState extends State<Silver_page> {
  ScrollController _scrollController = ScrollController();
  bool _showImage = true;
  bool _showTitle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: CustomScrollView(slivers: [
        //2
        SliverAppBar(
          // foregroundColor: Colors.grey,
          expandedHeight: 2 ,
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          collapsedHeight: 50,
          pinned: true,
          floating: false,
          leading: Icon(Icons.arrow_back),
          title: Text("Blouse"),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Blouse', textScaleFactor: 1),
            background: Image.asset(
              'assets/images/blouse.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          delegate: SliverChildListDelegate(
            [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/blouse.png",scale: 3,),
                      Text("Princess-Cut Blouse"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Starting at ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: '₹959 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      )

// title: name[index]
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //         (_, int index) {
        //       return ListTile(
        //         leading: Container(
        //             padding: EdgeInsets.all(8),
        //             width: 100,
        //             child: Placeholder()),
        //         title: Text('Place ${index + 1}', textScaleFactor: 2),
        //       );
        //     },
        //     childCount: 20,
        //   ),
        // ),
      ]

//         SliverGrid(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 5,
//           mainAxisSpacing: 5,
//         ),
//         delegate: SliverChildListDelegate(
//           [
//
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,color: Colors.black
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset("assets/history.png"),
//                     Text("Princess-Cut Blouse"),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(text: 'Starting at ',
//                               style: TextStyle(color: Colors.grey)),
//                           TextSpan(text: '₹959 ',style:
//                           TextStyle(color: Colors.black)),
//                         ],
//                       ),
//
//                     )
//
//
// // title: name[index]
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

          ),
    );
//       SafeArea(child: Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           SliverAppBar(
//             leading: IconButton(
//                 onPressed: () async {
//                   Navigator.pop(context);
//                 },
//                 icon: Image.asset(
//                   closebtn,
//                   height: 70,
//                   width: 70,
//                 )),
//             automaticallyImplyLeading: false,
//             toolbarHeight: 50,
//             backgroundColor: appbvar,
//             elevation: 0,
//             // stretch: false,
//             pinned: true,
//             collapsedHeight: 50,
//             expandedHeight: 200.0,
//             floating: false,
//             flexibleSpace: FlexibleSpaceBar(
//                 title: _showTitle
//                     ? Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text("starting ftrom"),
//                             Text("₹ 979")
//                           ],
//                         ),
//                         // Image(image: AssetImage("assets/bank.png"))
//                       ],
//                     )
//
//                   ],
//                 )
//                     : Text(
//                   SETTING,
//                   style: GoogleFonts.aclonica(
//                     textStyle: TextStyle(
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 background: _showImage
//                     ? Image.asset(
//                   appbarbg, // Replace this with your own image
//                   fit: BoxFit.cover,
//                 )
//                     : Image.asset(
//                   appbarbg, // Replace this with your own image
//                   fit: BoxFit.cover,
//                 )
//              ),
//           ),
//           Text("Pick your style"),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 5,
//               mainAxisSpacing: 5,
//             ),
//             delegate: SliverChildListDelegate(
//               [
//                 Container(
//                   child: InkWell(
//                     onTap: () {
//
//
//                     },
//                     child: Column(
//                       children: [
//                         Image.asset("assets/history.png"),
//                        Text("Princess-Cut Blouse"),
//                         RichText(
//                           text: TextSpan(
//                             children: <TextSpan>[
//                               TextSpan(text: 'Starting at ',
//                                   style: TextStyle(color: Colors.grey)),
//                               TextSpan(text: '₹959 ',style:
//                               TextStyle(color: Colors.black)),
//                             ],
//                           ),
//
//                         )
//
//
// // title: name[index]
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: InkWell(
//                     onTap: () {
//
//
//                     },
//                     child: Column(
//                       children: [
//                         Image.asset("assets/history.png"),
//                        Text("Princess-Cut Blouse"),
//                         RichText(
//                           text: TextSpan(
//                             children: <TextSpan>[
//                               TextSpan(text: 'Starting at ',
//                                   style: TextStyle(color: Colors.grey)),
//                               TextSpan(text: '₹959 ',style:
//                               TextStyle(color: Colors.black)),
//                             ],
//                           ),
//
//                         )
//
//
// // title: name[index]
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: InkWell(
//                     onTap: () {
//
//
//                     },
//                     child: Column(
//                       children: [
//                         Image.asset("assets/history.png"),
//                         Text("Princess-Cut Blouse"),
//                         RichText(
//                           text: TextSpan(
//                             children: <TextSpan>[
//                               TextSpan(text: 'Starting at ',
//                                   style: TextStyle(color: Colors.grey)),
//                               TextSpan(text: '₹959 ',style:
//                               TextStyle(color: Colors.black)),
//                             ],
//                           ),
//
//                         )
//
//
// // title: name[index]
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                 child: InkWell(
//                   onTap: () {
//
//
//                   },
//                   child: Column(
//                     children: [
//                       Image.asset("assets/history.png"),
//                       Text("Princess-Cut Blouse"),
//                       RichText(
//                         text: TextSpan(
//                           children: <TextSpan>[
//                             TextSpan(text: 'Starting at ',
//                                 style: TextStyle(color: Colors.grey)),
//                             TextSpan(text: '₹959 ',style:
//                             TextStyle(color: Colors.black)),
//                           ],
//                         ),
//
//                       )
//
//
// // title: name[index]
//                     ],
//                   ),
//                 ),
//               ),
//                 Container(
//                 child: InkWell(
//                   onTap: () {
//
//
//                   },
//                   child: Column(
//                     children: [
//                       Image.asset("assets/history.png"),
//                       Text("Princess-Cut Blouse"),
//                       RichText(
//                         text: TextSpan(
//                           children: <TextSpan>[
//                             TextSpan(text: 'Starting at ',
//                                 style: TextStyle(color: Colors.grey)),
//                             TextSpan(text: '₹959 ',style:
//                             TextStyle(color: Colors.black)),
//                           ],
//                         ),
//
//                       )
//
//
// // title: name[index]
//                     ],
//                   ),
//                 ),
//               ),
//                 Container(
//                 child: InkWell(
//                   onTap: () {
//
//
//                   },
//                   child: Column(
//                     children: [
//                       Image.asset("assets/history.png"),
//                       Text("Princess-Cut Blouse"),
//                       RichText(
//                         text: TextSpan(
//                           children: <TextSpan>[
//                             TextSpan(text: 'Starting at ',
//                                 style: TextStyle(color: Colors.grey)),
//                             TextSpan(text: '₹959 ',style:
//                             TextStyle(color: Colors.black)),
//                           ],
//                         ),
//
//                       )
//
//
// // title: name[index]
//                     ],
//                   ),
//                 ),
//               ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
  }
  // void openteligram() async {
  //   final String groupLink = "https://t.me/hopegamings"; // Replace with your Telegram group link
  //
  //   if (await canLaunch(groupLink)) {
  //     await launch(groupLink);
  //   } else {
  //     throw "Could not launch $groupLink";
  //   }
  // }
  // var map;
  // var depo;
  // var wdrl;
  // viewprofile() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid = prefs.getString("userId");
  //   final response = await http.post(
  //     Uri.parse(Apiconst.profile),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "id": '${userid}',
  //     }),
  //   );
  //   var data = jsonDecode(response.body);
  //   print(data);
  //   print("mmmmmmmmmmmm");
  //   if (data['error'] == '200') {
  //     setState(() {
  //       map = data['userdata'];
  //       depo = data['deposit'];
  //       wdrl = data['withdrawal'];
  //     });
  //   }
  // }
}
