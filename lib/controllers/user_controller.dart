import 'package:get/get.dart';
import 'package:states/models/user.dart';

class UserController extends GetxController {
  // My Observables
  var userExists = false.obs;
  var user = User().obs;

  get professionsCount => user.value.professions!.length;

  void loadUser(User? user) {
    this.userExists.value = true;
    this.user.value = user!;
  }

  void changeAge(int newAge) {
    this.user.update((currentUser) => currentUser!.age = newAge);
  }

  void addProfession() {
    this.user.update((currentUser) => currentUser!.professions = [
          ...currentUser.professions!,
          'Profession ${professionsCount + 1}'
        ]);
  }
}
