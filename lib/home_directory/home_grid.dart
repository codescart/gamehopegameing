import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hopegamings/colorpredication/home.dart';
import 'package:hopegamings/contant/assets_constant.dart';
import 'package:hopegamings/home_directory/commingsoon.dart';

class homegrid extends StatefulWidget {
  const homegrid({Key? key}) : super(key: key);

  @override
  State<homegrid> createState() => _homegridState();
}

class _homegridState extends State<homegrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => colorpredicationhome()));
          },
          child: Container(

            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(colorpridictionicon)),
            ),
          ),
        ),
        InkWell(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Comming_Soon(skip:'LUDO')));
        },
          child: Container(
            // height: 100.r,
            // width: 120.r,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.fill, image: AssetImage(ludoicon)),
            ),
          ),
        ),
        InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Comming_Soon(skip:'AVAITOR')));
        },
          child: Container(

            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(Aviatorlogo)),
            ),
          ),
        ),
        InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Comming_Soon(skip:'TEEN PATTI')));
        },
          child: Container(

            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(commingsoonlogo)),
            ),
          ),
        ),
        InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Comming_Soon(skip:'DRAGON TIGER')));
        },
          child: Container(

            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(dragontiger)),
            ),
          ),
        ),
        InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Comming_Soon(skip:'PLINKO')));
        },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(pinklo)),
            ),
          ),
        ),
      ],
    );
  }
}
