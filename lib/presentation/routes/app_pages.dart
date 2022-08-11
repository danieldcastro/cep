import 'package:cep/presentation/bindings/history_binding.dart';
import 'package:cep/presentation/bindings/home_binding.dart';
import 'package:cep/presentation/bindings/search_binding.dart';
import 'package:get/get.dart';

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
