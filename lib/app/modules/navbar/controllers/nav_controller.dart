import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Index tab yang aktif
  var selectedIndex = 0.obs;

  // Daftar rute sesuai urutan di Bottom Navigation Bar
  final List<String> routes = [
    '/home',
    '/account',
    '/transaction',
    '/statistic',
    '/profile',
  ];

  // Fungsi untuk mengubah tab aktif dan navigasi rute
  void changeTabIndex(int index) {
    selectedIndex.value = index;
    Get.offNamed(routes[index], id: 1); // Pastikan ID 1 untuk navigator nested
  }
}
