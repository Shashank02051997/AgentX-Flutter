import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../apis/agents_api.dart';
import '../../models/agents_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/snackbar_status.dart';

class AgentsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AgentsApi _agentsApi = AgentsApi();

  final LiquidController liquidController = LiquidController();

  TabController? tabController;

  var bgColors = [];

  var allAgents = <Datum>[].obs;
  var activeIndex = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    _getAgentsList();
    super.onInit();
  }

  void _getAgentsList() async {
    isLoading.value = true;
    var response = await _agentsApi.getAgents();
    if (response.status == 200) {
      allAgents.clear();
      allAgents.addAll(response.data);
      tabController = TabController(length: allAgents.length, vsync: this);
      bgColors = AppUtils.generateRandomColors(allAgents.length);
    } else {
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
