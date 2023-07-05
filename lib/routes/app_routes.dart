import 'package:get/get.dart';

import '../modules/agents/agents_binding.dart';
import '../modules/agents/agents_page.dart';
import 'app_pages.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.agentsPage,
      page: () => AgentsPage(),
      binding: AgentsBinding(),
    ),
  ];
}
