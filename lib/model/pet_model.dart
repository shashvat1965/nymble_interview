import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

part 'pet_model.g.dart';

@HiveType(typeId: 1)
class Pet {
  @HiveField(0)
  bool isAdopted;

  @HiveField(1)
  String image;

  @HiveField(2)
  int age;

  @HiveField(3)
  String name;

  @HiveField(4)
  int price;

  @HiveField(5)
  int id;

  Pet(
      {required this.name,
      required this.price,
      required this.image,
      required this.age,
      required this.isAdopted,
      required this.id});
}

@HiveType(typeId: 2)
class PetList extends StateNotifier<List<Pet>> {
  @HiveField(0)
  List<Pet> petList;

  PetList({required this.petList}) : super(petList);

  void adoptPet(int id) {
    var box = Hive.box("petBox");
    PetList newPetListHive = box.get(1);
    for (Pet pet in newPetListHive.petList) {
      if (pet.id == id) {
        pet.isAdopted = true;
      }
    }
    box.put(1, newPetListHive);
    state = [
      for (final pet in state)
        if (pet.id == id)
          Pet(
            name: pet.name,
            id: pet.id,
            price: pet.price,
            image: pet.image,
            isAdopted: true,
            age: pet.age,
          )
        else
          pet,
    ];
  }
}

final searchQueryProvider = StateProvider<String>((ref) => "");

final filteredPetListProvider =
    StateNotifierProvider.family<PetList, List<Pet>, String>((ref, value) {
  List<Pet> petListTemp = ref.watch(petListProvider);
  List<Pet> filteredPetList = petListTemp
      .where((element) =>
          (element.name.toLowerCase().contains(value.toLowerCase())))
      .toList();
  return PetList(petList: filteredPetList);
});

final petListProvider = StateNotifierProvider<PetList, List<Pet>>((ref) {
  var box = Hive.box('petBox');
  PetList newPetListHive = box.get(1);
  return box.get(1);
});
