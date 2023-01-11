import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_interview/model/pet_model.dart';
import 'package:nymble_interview/screens/ListScreen/list_item.dart';

final confettiController =
    ConfettiController(duration: const Duration(seconds: 3));

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Pet> petList =
        ref.watch(filteredPetListProvider(ref.watch(searchQueryProvider)));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, left: 40.w, right: 40.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                    tag: 'dash',
                    child: ConfettiWidget(
                      numberOfParticles: 50,
                      confettiController: confettiController,
                      shouldLoop: false,
                      blastDirectionality: BlastDirectionality.explosive,
                      child: Image.asset(
                        "assets/images/doggo.png",
                        height: 80,
                      ),
                    )),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => const LinearGradient(colors: [
                    Color.fromRGBO(209, 154, 8, 1),
                    Color.fromRGBO(254, 212, 102, 1),
                    Color.fromRGBO(227, 186, 79, 1),
                    Color.fromRGBO(209, 154, 8, 1),
                    Color.fromRGBO(209, 154, 8, 1),
                  ]).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 1.sw,
              height: 50.h,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(209, 154, 8, 1),
                    Color.fromRGBO(254, 212, 102, 1),
                    Color.fromRGBO(227, 186, 79, 1),
                    Color.fromRGBO(209, 154, 8, 1),
                    Color.fromRGBO(209, 154, 8, 1),
                  ]),
                  borderRadius: BorderRadius.circular(40.r)),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40.r)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) =>
                                  const LinearGradient(colors: [
                                Color.fromRGBO(209, 154, 8, 1),
                                Color.fromRGBO(254, 212, 102, 1),
                                Color.fromRGBO(227, 186, 79, 1),
                                Color.fromRGBO(209, 154, 8, 1),
                                Color.fromRGBO(209, 154, 8, 1),
                              ]).createShader(Rect.fromLTWH(
                                      0, 0, bounds.width, bounds.height)),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                cursorHeight: 30.sp,
                                style: GoogleFonts.caveat(
                                    color: Colors.white, fontSize: 30.sp),
                                decoration: InputDecoration(
                                    hintText: "Search",
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle: GoogleFonts.caveat(
                                        color: Colors.white, fontSize: 30.sp),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  ref
                                      .read(searchQueryProvider.notifier)
                                      .update((state) => value);
                                },
                              ),
                            ),
                          ),
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) =>
                                const LinearGradient(colors: [
                              Color.fromRGBO(209, 154, 8, 1),
                              Color.fromRGBO(254, 212, 102, 1),
                              Color.fromRGBO(227, 186, 79, 1),
                              Color.fromRGBO(209, 154, 8, 1),
                              Color.fromRGBO(209, 154, 8, 1),
                            ]).createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height)),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30.r,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListItem(
                    id: petList[index].id,
                  );
                },
                itemCount: petList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
