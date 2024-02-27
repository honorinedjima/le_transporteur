import 'package:get/get.dart';

import '../../../../presentation/accueil/controllers/accueil.controller.dart';

class AccueilControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccueilController>(
      () => AccueilController(),
    );
  }
}
