import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/pages/page1.dart';
import 'package:states/pages/page2.dart';

import 'controllers/user_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dependency Injection, like settings MultiProvider at the top Widget
    final userCtrl = Get.put(UserController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      getPages: [
        GetPage(name: '/page1', page: () => Page1()),
        GetPage(name: '/page2', page: () => Page2()),
      ],
    );
  }
}
