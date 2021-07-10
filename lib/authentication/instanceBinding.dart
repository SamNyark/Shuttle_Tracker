import 'package:get/get.dart';
import 'package:shuttle_tracker/providers/getController.dart';
import 'firebaseController.dart';

class InstanceBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
    Get.lazyPut<GetController>(() => GetController());
  }
}
