import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertPopup extends StatelessWidget {
  final String title;
  final String content;
  final Function onCanceled;

  const AlertPopup(
      {Key? key,
      required this.title,
      required this.content,
      required this.onCanceled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: Get.width * .9, minWidth: Get.width * .9),
        child: Material(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            type: MaterialType.card,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Icon(Icons.error,
                          color: Get.theme.primaryColor,
                          size: 40,
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        title.tr,
                        style: TextStyle(
                            fontSize: Get.textTheme.headline6!.fontSize,
                            fontWeight: FontWeight.bold,
                            color: Get.theme.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        content.tr,
                        style: TextStyle(
                            fontSize: Get.textTheme.subtitle1!.fontSize,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.infinity,
                        child: FlatButton(
                            height: 50,
                            color: Get.theme.primaryColor,
                            child: Text(
                                  'Retour',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: onCanceled as void Function()?))
                  ],
                ))),
      ),
    );
  }
}