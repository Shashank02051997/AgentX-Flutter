import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/colors_theme.dart';
import 'snackbar_status.dart';

class AppUtils {
  static void showSnackBar(String message,
      {String title = "Error", MessageStatus status = MessageStatus.NORMAL}) {
    Color backgroundColor;
    switch (status) {
      case MessageStatus.SUCCESS:
        backgroundColor = ThemeColor.green;
        break;
      case MessageStatus.ERROR:
        backgroundColor = ThemeColor.red;
        break;
      case MessageStatus.WARNING:
        backgroundColor = ThemeColor.orange;
        break;
      case MessageStatus.NORMAL:
      default:
        backgroundColor = ThemeColor.black;
        break;
    }

    Get.snackbar(
      title,
      message,
      borderRadius: 4,
      snackPosition: SnackPosition.BOTTOM,
      colorText: ThemeColor.white,
      backgroundColor: backgroundColor,
    );
  }
}
