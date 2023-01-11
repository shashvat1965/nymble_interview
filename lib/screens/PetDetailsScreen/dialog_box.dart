import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(209, 154, 8, 1),
                Color.fromRGBO(254, 212, 102, 1),
                Color.fromRGBO(227, 186, 79, 1),
                Color.fromRGBO(209, 154, 8, 1),
                Color.fromRGBO(209, 154, 8, 1),
              ]),
              borderRadius: BorderRadius.circular(10.r)),
          width: 250.w,
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(colors: [
                      Color.fromRGBO(209, 154, 8, 1),
                      Color.fromRGBO(254, 212, 102, 1),
                      Color.fromRGBO(227, 186, 79, 1),
                      Color.fromRGBO(209, 154, 8, 1),
                      Color.fromRGBO(209, 154, 8, 1),
                    ]).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                    child: Text(
                      "Congratulations!\nYou have adopted ${widget.name} !",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.caveat(
                          color: Colors.amber, fontSize: 20.sp),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
