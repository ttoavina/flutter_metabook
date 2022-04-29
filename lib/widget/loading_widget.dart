import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoadingDialog() {
  return Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo))),
      ),
      barrierDismissible: false);
}

closeLoadingDialog() {
  if (Get.isDialogOpen!) Get.back();
}

Future<bool> checkConnexion() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // do the operation for connected, or change the bool to True for connected
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
