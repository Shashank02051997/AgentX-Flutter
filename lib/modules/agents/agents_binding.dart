import 'package:get/get.dart';

import 'agents_controller.dart';

class AgentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgentsController());
  }
}
