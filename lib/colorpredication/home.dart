import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hopegamings/colorpredication/Myrecord.dart';
import 'package:hopegamings/colorpredication/balance_recharge.dart';
import 'package:hopegamings/colorpredication/becone_record.dart';
import 'package:hopegamings/colorpredication/buttongridview2.dart';
import 'package:hopegamings/colorpredication/trend.dart';
import 'package:hopegamings/contant/Api_constant.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/contant/color_constant.dart';
import 'package:hopegamings/contant/color_constant.dart';
import 'package:hopegamings/contant/text_constant.dart';
import 'package:hopegamings/widgets/gridcontainer.dart';
import 'package:hopegamings/widgets/listcontainer.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'buttongridview.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hopegamings/colorpredication/Myrecord.dart';

List<BetRecord> _betlist = [];
List<pertrecord> _listdata = [];
int ?wallet;
bool popups=false;
class colorpredicationhome extends StatefulWidget {
  const colorpredicationhome({Key? key}) : super(key: key);
  @override
  State<colorpredicationhome> createState() => _colorpredicationhomeState();
}

class _colorpredicationhomeState extends State<colorpredicationhome> {
  final CountdownController _controller =
      new CountdownController(autoStart: true);
  late final Duration timerTastoPremuto;
  @override
  void initState() {
    qwe(0);
    Partelyrecord(0);

    walletview();
    startTimer();
    periodget();
    _betlist.clear();
    // TODO: implement initState
    super.initState();
  }


  int parity = 0;
  int myrecord = 0;


  walletview() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.walletamount + 'userid=$userid'),
    );
    var data = jsonDecode(response.body);
    print(data);
    print("mmmmmmmmmmmm");
    if (data['error'] == '200') {
      setState(() {
        final walt = data['data'];
        wallet=walt['wallet']==null?0:int.parse(walt['wallet']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: RefreshIndicator(
            displacement: 250,
            backgroundColor: Colors.yellow,
            color: Colors.red,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 1500));
              setState(() {
                qwe(0);
                Partelyrecord(0);
                walletview();
              });
            },
            child: Container(
              height: double.infinity.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(background)),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: 120.h,
                    width: 380.w,
                    color: custonbtn,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                _onWillPop();
                              },
                              icon: Icon(Icons.arrow_back_ios)),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                wallet == null
                                    ? Avilablebalance
                                    :
                                   Avilablebalancein +
                                        wallet.toString(),
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 3.0, right: 3),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => balance()));
                                },
                                child: Card(
                                  elevation: 5,
                                  color: klightblue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: 40.h,
                                    width: 100.w,
                                    child: Center(
                                      child: Text(
                                        'Recharge',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: kWhiteColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 3.0, right: 3),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => trendss()));
                                },
                                child: Card(
                                  elevation: 5,
                                  color: kWhiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: 40.h,
                                    width: 100.w,
                                    child: Center(
                                      child: Text(
                                        'Trend',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: kBlackColor900),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(onPressed: () async {
                              await Future.delayed(Duration(milliseconds: 1500));
                              setState(() {
                                qwe(0);
                                Partelyrecord(0);
                                walletview();
                              });
                            },
                                icon: Icon(Icons.refresh,))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Image.asset(trophy,
                            scale: 1.5, color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Period',
                          style:
                              TextStyle(color: kBlackColor800, fontSize: 15.sp),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: Text(
                          'Count Down',
                          style: TextStyle(color: kBlackColor800, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 4.w,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              periods.toString(),
                              style: TextStyle(
                                  color: kBlackColor900,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Spacer(),
                          Container(
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 15),
                              child: buildTime1()),
                        ],
                      ),
                      hide==false?
                      button():listcontainer(),
                      hide==false? buttongridview():Gridcontainer(),
                      becone(_listdata),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: parity == 0
                                    ? () {}
                                    : () {
                                        setState(() {
                                          parity = parity - 10;
                                        });
                                        Partelyrecord(parity);
                                      },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: kBlackColor900,
                                )),
                            Center(
                              child: Text(
                                parity.toString(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: kBlackColor900,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    parity = parity + 10;
                                  });
                                  Partelyrecord(parity);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: kBlackColor900,
                                )),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.teal,
                        thickness: 2,
                      ),
                      MY_Record(_betlist),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: myrecord == 0
                                    ? () {}
                                    : () {
                                        setState(() {
                                          myrecord = myrecord - 10;
                                        });
                                        qwe(myrecord);
                                      },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: kBlackColor900,
                                )),


                            Center(
                              child: Text(myrecord.toString(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: kBlackColor900,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  // int amo=0;
                                  setState(() {
                                    myrecord = myrecord + 10;
                                  });
                                  qwe(myrecord);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: kBlackColor900,
                                )),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.teal,
                        thickness: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final isRunning = countdownTimer == null ? false : countdownTimer!.isActive;
    if (isRunning) {
      countdownTimer!.cancel();

    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 2);
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 1, seconds: 59));
  }
  // Step 6

  late DateTime _dateTime;
bool frist=true;
bool hide=false;

  void setCountDown() {
    hiddenbat();
    final reduceSecondsBy = 1;
    _dateTime = DateTime.now().toUtc();
if(frist==true){

  setState(() {
    frist=false;
  });
  if(_dateTime.minute.isOdd){
 final seconds=   118-60-_dateTime.second;
    myDuration = Duration(seconds: seconds);

  }else{
    final seconds=   118-_dateTime.second;
    myDuration = Duration(seconds: seconds);
  }


}else{
  setState(() {
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      // countdownTimer!.cancel();
      periodget();
      qwe(0);
      Partelyrecord(0);
      walletview();
      startTimer();
      resetTimer();


    } else {
      myDuration = Duration(seconds: seconds);
      print(seconds);
    }
  });
}
  }

Color colord=kGreyColor600;
void hiddenbat(){
  if(myDuration.inSeconds==30){
    setState(() {
      colord=Colors.red;
    });
  }else if(myDuration.inSeconds==60){
    setState(() {
      colord=Colors.yellow;
    });
  }else if(myDuration.inMinutes==01){
    setState(() {
      colord=Colors.green;
    });
  }

  if(myDuration.inSeconds<32 ){
      setState(() {
        hide=true;
      });
      if(popups==true&& myDuration.inSeconds==30){
        setState(() {
          popups=false;
        });
        Navigator.pop(context);
      }
      // if(hide==true&& myDuration.inSeconds==60){
      //   setState(() {
      //     hide=false;
      //   });
      //   Navigator.pop(context);
      // }
    }else{
      setState(() {
        hide=false;
      });
    }

}

  Widget buildTime1() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(2));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(

                color:  colord,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              time,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackColor900,
                  fontSize: 15),
            ),
          ),
        ],
      );
  periodget(){

  }
  Partelyrecord(int partlyamo) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    print(Apiconst.parityrecord + 'limit=$partlyamo');
    final response = await http.get(Uri.parse(
      Apiconst.parityrecord + 'limit=$partlyamo',
    ));
    if (response.statusCode == 200) {
      _listdata.clear();
      // final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      final jsonData = json.decode(response.body)['data'];
     if(partlyamo==0){
       setState(() {
         periods= int.parse(jsonData[0]['gamesno'].toString())+1;
       });

     }
      for (var i = 0; i < jsonData.length; i++) {
        var period = jsonData[i]['gamesno'];
        var prise = jsonData[i]['price'];
        var number = jsonData[i]['number'];
        print(period);
        _listdata.add(pertrecord(period, prise, number));

        // setState(() {
        //   _listdata.add(pertrecord(period, prise, number));
        // });
      }

      print(_listdata);
      print('ttttttttttttttttt');
      // return jsonData.map((item) => partlyrecord.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

}
int periods=0;





///---------------------------------api------------------
qwe(int myrecordamo) async {
  final prefs = await SharedPreferences.getInstance();
  final userid = prefs.getString("userId");
  print(userid);
  final response = await http.get(Uri.parse(
    Apiconst.myrecord + 'limit=$myrecordamo&userid=$userid',
  ));
  if (response.statusCode == 200) {
    _betlist.clear();
    // final jsonData = json.decode(response.body)['data'] as List<dynamic>;
    final jsonData = json.decode(response.body)['data'];

    for (var i = 0; i < jsonData.length; i++) {
      var amount = jsonData[i]['amount'].toString();
      var totalamount = jsonData[i]['totalamount'].toString();
      var color = jsonData[i]['color'].toString();
      var number = jsonData[i]['number'].toString();
      var gamesno = jsonData[i]['gamesno'].toString();
      var commission = jsonData[i]['commission'].toString();
      var status = jsonData[i]['status'].toString();
      var win = jsonData[i]['win'].toString();
      var datetime = jsonData[i]['datetime'].toString();
      var winnumber = jsonData[i]['winnumber'].toString();


      _betlist.add(BetRecord(amount, totalamount, color, number, gamesno,
          commission, status, win, datetime,winnumber,));

      // setState(() {
      //   _betlist.add(BetRecord(amount, totalamount, color,number, gamesno, commission, status, win, datetime));
      // });
    }
    print('ttttttttttttttttt');
  } else {
    throw Exception('Failed to load data');
  }
}

class BetRecord {
  final String amount;
  final String totalamount;
  final String color;
  final String number;
  final String gamesno;
  final String commission;
  final String status;
  final String win;
  final String datetime;
  final String winnumber;

  // final Color color;
  BetRecord(
    this.amount,
    this.totalamount,
    this.color,
    this.number,
    this.gamesno,
    this.commission,
    this.status,
    this.win,
    this.datetime,
    this.winnumber,
  );
}

class pertrecord {
  final String period;
  final String prise;
  final String number;
  // final Color color;
  pertrecord(this.period, this.prise, this.number);
}


