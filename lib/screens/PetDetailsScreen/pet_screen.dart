import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../model/pet_model.dart';
import '../ListScreen/list_view.dart';
import 'dialog_box.dart';

class PetDetailsScreen extends ConsumerWidget {
  const PetDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Pet pet = ref
        .watch(petListProvider.notifier)
        .state
        .where((element) => (element.id == id))
        .first;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Hero(
                tag: 'pet-avatar $id',
                child: Container(
                  width: 1.sw,
                  height: 300.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage("assets/images/${pet.image}")),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.r),
                          bottomLeft: Radius.circular(20.r))),
                )),
            Padding(
              padding: EdgeInsets.only(top: 25.h, left: 15.w),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(209, 154, 8, 1),
                    Color.fromRGBO(254, 212, 102, 1),
                    Color.fromRGBO(227, 186, 79, 1),
                    Color.fromRGBO(209, 154, 8, 1),
                    Color.fromRGBO(209, 154, 8, 1),
                  ]),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.black),
                      height: 50.h,
                      width: 50.w,
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color.fromRGBO(209, 154, 8, 1),
                              Color.fromRGBO(254, 212, 102, 1),
                              Color.fromRGBO(227, 186, 79, 1),
                              Color.fromRGBO(209, 154, 8, 1),
                              Color.fromRGBO(209, 154, 8, 1),
                            ]).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => const LinearGradient(colors: [
                Color.fromRGBO(209, 154, 8, 1),
                Color.fromRGBO(254, 212, 102, 1),
                Color.fromRGBO(227, 186, 79, 1),
                Color.fromRGBO(209, 154, 8, 1),
                Color.fromRGBO(209, 154, 8, 1),
              ]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                "Name: ${pet.name}",
                style: GoogleFonts.caveat(color: Colors.amber, fontSize: 30.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => const LinearGradient(colors: [
                Color.fromRGBO(209, 154, 8, 1),
                Color.fromRGBO(254, 212, 102, 1),
                Color.fromRGBO(227, 186, 79, 1),
                Color.fromRGBO(209, 154, 8, 1),
                Color.fromRGBO(209, 154, 8, 1),
              ]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                "Price: ${pet.price}",
                style: GoogleFonts.caveat(color: Colors.amber, fontSize: 30.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => const LinearGradient(colors: [
                Color.fromRGBO(209, 154, 8, 1),
                Color.fromRGBO(254, 212, 102, 1),
                Color.fromRGBO(227, 186, 79, 1),
                Color.fromRGBO(209, 154, 8, 1),
                Color.fromRGBO(209, 154, 8, 1),
              ]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                "Age: ${pet.age}",
                style: GoogleFonts.caveat(color: Colors.amber, fontSize: 30.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (!pet.isAdopted) {
                      ref.watch(petListProvider.notifier).adoptPet(id);
                      confettiController.play();
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) => DialogBox(
                                name: pet.name,
                              ));
                    }
                  },
                  child: Container(
                    height: 60.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(209, 154, 8, 1),
                        Color.fromRGBO(254, 212, 102, 1),
                        Color.fromRGBO(227, 186, 79, 1),
                        Color.fromRGBO(209, 154, 8, 1),
                        Color.fromRGBO(209, 154, 8, 1),
                      ]),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.black),
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Color.fromRGBO(209, 154, 8, 1),
                                Color.fromRGBO(254, 212, 102, 1),
                                Color.fromRGBO(227, 186, 79, 1),
                                Color.fromRGBO(209, 154, 8, 1),
                                Color.fromRGBO(209, 154, 8, 1),
                              ]).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                          child: Text(
                            pet.isAdopted ? "Pet Adopted!" : "Adopt Pet",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.caveat(
                                color: Colors.amber, fontSize: 30.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
