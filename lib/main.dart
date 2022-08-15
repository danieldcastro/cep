import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/bindings/initial_binding.dart';
import 'presentation/routes/app_pages.dart';
import 'presentation/routes/routes.dart';
import 'presentation/theme/app_colors.dart';
import 'presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors().lightPurpleColor));
    return GetMaterialApp(
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      title: 'CEP',
      initialBinding: InitialBinding(),
      defaultTransition: Transition.fadeIn,
      theme: AppTheme.theme,
    );
  }
}
