import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/pet_model.dart';
import '../PetDetailsScreen/pet_screen.dart';

class ListItem extends ConsumerWidget {
  const ListItem({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Pet> petList = ref.watch(petListProvider);
    Pet pet = petList.where((element) => (element.id == id)).first;

    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Hero(
              tag: 'pet-avatar $id',
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/${pet.image}"),
                radius: 30.r,
              ),
            ),
            SizedBox(
              width: 30.w,
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
                pet.name,
                style: GoogleFonts.caveat(color: Colors.amber, fontSize: 30.sp),
              ),
            ),
          ],
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
          child: pet.isAdopted
              ? Text(
                  "Already Adopted! ",
                  style:
                      GoogleFonts.caveat(color: Colors.white, fontSize: 20.sp),
                )
              : IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PetDetailsScreen(
                                  id: id,
                                )));
                  },
                ),
        )
      ]),
    );
  }
}
