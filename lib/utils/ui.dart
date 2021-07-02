import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rfidlabunasman/utils/widget/loading_widget.dart';

// class for UI utils
class UI {
  /// info snackbar
  static info(String title, String message) {
    Get.snackbar(
      '$title',
      '$message',
      colorText: Colors.white,
      // backgroundColor: kPrimaryColor,
      icon: Icon(
        FeatherIcons.info,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// buat loading
  static Future<void> loading(BuildContext context,
      {String loading: 'Loading ...'}) async {
    await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              children: [
                LoadingWidget(
                  loadingText: loading,
                ),
              ],
            ));
  }
}
