import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hopegamings/contant/color_constant.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedText = ''; // Store the selected text
  Color selectedTextColor = Colors.black; // Store the text color

  void selectText(String text) {
    // Update the selected text and text color
    setState(() {
      selectedText = text;
      selectedTextColor = text == 'UPI' ? kRedLightColor : kRedLightColor; // Change color based on selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Selection Example'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            GestureDetector(
              onTap: () => selectText('UPI'),
              child: Card(

                color: selectedText == 'UPI' ? selectedTextColor : kGreenLightColor,
                elevation: 5,
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          'UPI',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        right: 5,
                        child: selectedText == 'UPI'
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
              ),
            ),
            GestureDetector(
              onTap: () => selectText('Bank'),
              child: Card(
                color: selectedText == 'Bank' ? selectedTextColor : kGreenLightColor,
                elevation: 5,
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          'Bank',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        right: 5,
                        child: selectedText == 'Bank'
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
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Selected Text: $selectedText',
              style: TextStyle(
                fontSize: 20.0,
                color: selectedTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
