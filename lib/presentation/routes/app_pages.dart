import 'package:get/get.dart';

import '../bindings/history_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/search_binding.dart';
import '../pages/pages.dart';
import 'routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.SEARCH,
        page: () => const SearchPage(),
        binding: SearchBinding()),
    GetPage(
        name: Routes.HISTORY,
        page: () => const HistoryPage(),
        binding: HistoryBinding()),
  ];
}
