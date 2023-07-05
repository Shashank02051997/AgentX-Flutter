import 'package:agentx/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/agents/agents_binding.dart';
import 'modules/agents/agents_page.dart';
import 'themes/colors_theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'AgentX',
      theme: ThemeData(
        fontFamily: GoogleFonts.capriola().fontFamily,
      ).copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: ThemeColor.primaryDark)),
      home: AgentsPage(),
      initialBinding: AgentsBinding(),
      getPages: AppPages.pages,
    );
  }
}
