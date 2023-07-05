import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/agents_api.dart';
import '../../models/agents_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/snackbar_status.dart';

class AgentsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AgentsApi _agentsApi = AgentsApi();

  final PageController pageController = PageController(
    initialPage: 0,
  );

  TabController? tabController;

  var allAgents = <Datum>[].obs;
  var activeIndex = 0.obs;

  @override
  void onInit() {
    _getAgentsList();
    super.onInit();
  }

  void _getAgentsList() async {
    var response = await _agentsApi.getAgents();
    if (response.status == 200) {
      allAgents.clear();
      allAgents.addAll(response.data);
      tabController = TabController(length: allAgents.length, vsync: this);
    } else {
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
