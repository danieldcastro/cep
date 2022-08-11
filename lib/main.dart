import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/routes/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      locale: Get.deviceLocale,
      title: 'CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
