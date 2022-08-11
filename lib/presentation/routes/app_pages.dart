import 'package:get/get.dart';

import '../pages/pages.dart';
import 'routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: Routes.HOME, page: () => const HomePage()),
    GetPage(name: Routes.SEARCH, page: () => const SearchPage()),
    GetPage(name: Routes.HISTORY, page: () => const HistoryPage()),
  ];
}
