import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_facebook/login/login_controller.dart';
import 'package:super_facebook/login/login_view.dart';

void main() async {
  Get.lazyPut<LoginController>(() => LoginController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ato 2');

    return GetMaterialApp(
      title: 'FacebookPlus',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'facebook+ by Meta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Cardo'),
        ),
        centerTitle: true,
      ),
      body: LoginView(),
    );
  }
}
