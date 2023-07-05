import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../themes/colors_theme.dart';
import 'agents_controller.dart';

class AgentsPage extends StatelessWidget {
  const AgentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AgentsController agentsController = Get.find<AgentsController>();
    return Scaffold(
        body: Obx(
      () => Stack(children: [
        PageView.builder(
          itemCount: agentsController.allAgents.length,
          controller: agentsController.pageController,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: agentsController
                          .allAgents[index].backgroundGradientColors
                          .map((color) {
                        return Color(int.parse(color, radix: 16));
                      }).toList())),
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "${agentsController.allAgents[index].displayName?.toUpperCase()}",
                    style: TextStyle(
                        color: ThemeColor.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: Stack(children: [
                    Lottie.asset(
                        "assets/animations/lottie_background_sparkles.json",
                        width: double.infinity,
                        height: double.infinity,
                        repeat: true,
                        alignment: Alignment.center,
                        fit: BoxFit.contain),
                    Opacity(
                      opacity: 0.5,
                      child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width * 1.2,
                          height: MediaQuery.of(context).size.width * 1.2,
                          imageUrl:
                              agentsController.allAgents[index].background ??
                                  ""),
                    ),
                    CachedNetworkImage(
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl:
                            agentsController.allAgents[index].fullPortrait ??
                                ""),
                  ])),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          onPageChanged: (value) {
            agentsController.activeIndex.value = value;
            agentsController.tabController?.animateTo(
              value,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: DefaultTabController(
                  initialIndex: agentsController.activeIndex.value,
                  length: agentsController.allAgents.length,
                  child: Column(
                    children: [
                      ButtonsTabBar(
                        controller: agentsController.tabController,
                        radius: 8,
                        height: 80,
                        backgroundColor: Colors.transparent,
                        unselectedBackgroundColor: Colors.transparent,
                        borderColor: ThemeColor.red,
                        borderWidth: 4,
                        unselectedBorderColor: Colors.transparent,
                        buttonMargin: EdgeInsets.symmetric(horizontal: 28),
                        tabs:
                            agentsController.allAgents.mapIndexed((pos, item) {
                          return Tab(
                            icon: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ThemeColor.black),
                              width: 60,
                              height: agentsController.activeIndex.value == pos
                                  ? 80
                                  : 64,
                              child: agentsController.activeIndex.value == pos
                                  ? CachedNetworkImage(
                                      imageUrl: item.displayIcon ?? "")
                                  : Opacity(
                                      opacity: 0.5,
                                      child: CachedNetworkImage(
                                          imageUrl: item.displayIcon ?? ""),
                                    ),
                            ),
                          );
                        }).toList(),
                        onTap: (index) {
                          agentsController.activeIndex.value = index;
                          agentsController.tabController?.animateTo(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          agentsController.pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ]),
    ));
  }
}
