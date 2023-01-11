import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nymble_interview/model/pet_model.dart';
import 'package:nymble_interview/screens/WelcomeScreen/welcome_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PetListAdapter());
  Hive.registerAdapter(PetAdapter());
  await Hive.openBox('petBox');
  await Hive.openBox('firstRun');
  instantiatePetList();
  runApp(const ProviderScope(child: PetAdopApp()));
}

class PetAdopApp extends StatefulWidget {
  const PetAdopApp({Key? key}) : super(key: key);

  @override
  State<PetAdopApp> createState() => _PetAdopAppState();
}

class _PetAdopAppState extends State<PetAdopApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.42857142857144, 867.4285714285714),
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.black,
            body: WelcomeScreen(),
          ),
        );
      },
    );
  }
}

instantiatePetList() {
  if (Hive.box('firstRun').isEmpty) {
    var box = Hive.box('petBox');
    PetList petList = PetList(petList: [
      Pet(
          name: "bob",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 1),
      Pet(
          name: "hob",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 2),
      Pet(
          name: "kob",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 3),
      Pet(
          name: "job",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 4),
      Pet(
          name: "dob",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 5),
      Pet(
          name: "jack",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 6),
      Pet(
          name: "hack",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 7),
      Pet(
          name: "mack",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 8),
      Pet(
          name: "wolf",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 9),
      Pet(
          name: "golf",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 10),
      Pet(
          name: "john",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 11),
      Pet(
          name: "zeta",
          price: 250,
          image: "pet.png",
          age: 4,
          isAdopted: false,
          id: 12),
    ]);
    box.put(1, petList);
    Hive.box('firstRun').put(1, true);
  }
}
