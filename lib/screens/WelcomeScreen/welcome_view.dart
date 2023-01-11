import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_interview/screens/ListScreen/list_view.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(colors: [
              Color.fromRGBO(209, 154, 8, 1),
              Color.fromRGBO(254, 212, 102, 1),
              Color.fromRGBO(227, 186, 79, 1),
              Color.fromRGBO(209, 154, 8, 1),
              Color.fromRGBO(209, 154, 8, 1),
            ]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              "Welcome to Pet \nAdop",
              style: GoogleFonts.caveat(fontSize: 70),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 180.h),
            child: GestureDetector(
              key: const Key("welcome_button"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListScreen()));
                },
                child: Hero(
                  tag: 'dash',
                  child: Image.asset(
                    "assets/images/doggo.png",
                    height: 200.h,
                  ),
                )),
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(colors: [
              Color.fromRGBO(209, 154, 8, 1),
              Color.fromRGBO(254, 212, 102, 1),
              Color.fromRGBO(227, 186, 79, 1),
              Color.fromRGBO(209, 154, 8, 1),
              Color.fromRGBO(209, 154, 8, 1),
            ]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              "Tap to Continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.sp),
            ),
          )
        ],
      ),
    );
  }
}
