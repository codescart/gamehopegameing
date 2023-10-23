import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopegamings/Api_controller/paymentgateway_controller.dart';
import 'package:hopegamings/colorpredication/Reachargeqroption.dart';
import 'package:hopegamings/contant/Api_constant.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/contant/color_constant.dart';
import 'package:hopegamings/contant/text_constant.dart';
import 'package:hopegamings/widgets/custombutton.dart';
import 'package:hopegamings/widgets/flushbar.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class balance extends StatefulWidget {
  const balance({Key? key}) : super(key: key);

  @override
  State<balance> createState() => _balanceState();
}

class _balanceState extends State<balance> {
  @override
  void initState() {
    walletview();
    validatorcode();
    super.initState();
  }

  var wallet;
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
        wallet = data['data'];
      });
    }
  }

  String _errorMessage = "";
  String selectpayment = '';
  TextEditingController amount = TextEditingController();
  int _selectedItemIndex =
      10; // Initialize with a value that won't match any index

  bool _isButtonEnabled = false;
  List<int> dataItems = [100, 500, 1000, 2000, 5000, 10000, 49999];

  void _handleTextChange() {
    setState(() {
      _selectedItemIndex = 10; // Reset selected index
      _isButtonEnabled = amount.text.isNotEmpty;
    });
  }

  void _handleListItemSelected(int index) {
    setState(() {
      _selectedItemIndex = dataItems[index];
      amount.text = dataItems[index].toString(); // Update TextFormField text
      _isButtonEnabled = true;
    });
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var catogery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Recharge,
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
          image:
              DecorationImage(fit: BoxFit.fill, image: AssetImage(background)),
        ),
        child: Form(
          key: _formkey,
          child: ListView(shrinkWrap: true, children: [
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  wallet == null
                      ? Avilablebalance
                      : Avilablebalancein + wallet['wallet'].toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                )
              ],
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number.';
                  }
                  final intNumber = int.tryParse(value);
                  if (intNumber == null || intNumber < int.parse(validator['recharge_amount'])) {
                    return 'A amount must be at least ₹'+"${validator['recharge_amount']}.";
                  }
                  return null; // Validation passed.
                },
                controller: amount,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                style: TextStyle(color: kBlackColor900),
                onChanged: (text) {
                  _handleTextChange();
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.grey,
                    ),
                    hintText: enterrechargeamount,
                    helperStyle:
                        TextStyle(fontSize: 10, color: Colors.grey.shade200),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
                cursorColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 130,
                    childAspectRatio: 3.5 / 1.5,
                    mainAxisSpacing: 5),
                itemCount: dataItems.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      _handleListItemSelected(index);
                    },
                    child: Stack(
                      children: [
                        Card(
                          elevation: 5,
                          color: _selectedItemIndex == dataItems[index]
                              ? kRedLightColor
                              : kGreenLightColor,
                          child: Center(
                            child: Text(
                              '₹  ' + dataItems[index].toString(),
                              style: TextStyle(
                                  color: kBlackColor900,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 5,
                            right: 5,
                            child: _selectedItemIndex == dataItems[index]
                                ? Container(
                                    height: 12.r,
                                    width: 12.r,
                                    child: const CircleAvatar(
                                      child: Icon(
                                        Icons.check_outlined,
                                        size: 10,
                                      ),
                                    ),
                                  )
                                : Container()),
                      ],
                    ),
                  );
                }),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 100.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text(
                    'Payment',
                    style: TextStyle(
                        color: kGreyColor800,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            if (amount.text == '')
              Container()
            else
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: FutureBuilder<List<paymentgateway>>(
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
                          child: Text(
                            " payment Gateway not activated",
                            style: TextStyle(
                              color: kBlackColor900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () async {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      _errorMessage = ''; // Clear any previous error message.
                                    });
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                rechargeqroption(
                                                    amount: amount.text,
                                                    gatewayid:
                                                    snapshot.data![index])));
                                    // Process the valid input here.
                                  } else {
                                    setState(() {
                                      _errorMessage = 'Please correct the input.';
                                    });
                                  }



                                },
                                child: Container(
                                  height: 50.h,
                                  width: 150.w,
                                  child: Stack(
                                    children: [
                                      Card(
                                        elevation: 5,
                                        color: snapshot.data![index].id == '5'
                                            ? kRedLightColor
                                            : kGreenLightColor,
                                        child: Center(
                                          child: Text(
                                            '${snapshot.data![index].name}'
                                                .toUpperCase(),
                                            style: TextStyle(
                                                color: kBlackColor900,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),

          ]),
        ),
      ),
    );
  }

  Future<List<paymentgateway>> qwe() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http.get(Uri.parse(Apiconst.paymentgateway));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      print(response);
      print('ttttttttttttttttt');
      return jsonData.map((item) => paymentgateway.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }



  var validator;
  validatorcode() async {
    final response = await http.get(
      Uri.parse(Apiconst.validatorss),
    );
    var data = jsonDecode(response.body);
    print(data);
    print("mmmmmmmmmmmm");
    if (data['error'] == '200') {
      setState(() {
        validator = data['data'];
      });
    }
  }
}
