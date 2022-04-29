import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_facebook/api/api.dart';
import 'package:super_facebook/login/login_controller.dart';
import 'package:super_facebook/widget/alert_popup.dart';
import 'package:super_facebook/widget/loading_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.test();
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Se connecter",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  //                  height: 40.0,
                  width: double.infinity,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: "Entrez votre nom d'utilisateur/email",
                      isDense: true,
                      border: OutlineInputBorder(
                        //                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  //                  height: 40.0,
                  width: double.infinity,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      isDense: true,
                      border: new OutlineInputBorder(
                        //                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        'Mot de passe oublié?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        print("Mot de passe oublié");
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    height: 50,
                    color: Get.theme.primaryColor,
                    child: Text(
                      'Se connecter',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      try {
                        showLoadingDialog();
                        await controller.signIn();
                        closeLoadingDialog();
                        Get.dialog(AlertPopup(
                          title: "Probleme de connexion!",
                          content:
                              "Veuillez verifier votre mot de passe ou essayez avec une autre compte!",
                          onCanceled: () => Get.back(),
                        ));
                      } catch (e) {
                        print('$e');
                        closeLoadingDialog();
                        Get.dialog(AlertPopup(
                          title: "Probleme de connexion!",
                          content:
                              "Veuillez verifier votre connexion internet!",
                          onCanceled: () => Get.back(),
                        ));
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Vous n'avez pas encore une compte?",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  child: Text(
                    "Inscription",
                    style: TextStyle(color: Get.theme.primaryColor),
                  ),
                  onTap: () {
                    print('inscription');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
