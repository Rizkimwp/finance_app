import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticController extends GetxController
    with SingleGetTickerProviderMixin {
  var selectedDate = DateTime.now().obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController =
        TabController(length: 2, vsync: this); // Menggunakan `vsync: this`
  }

  void updateDate(DateTime? date) {
    if (date != null) {
      selectedDate.value = date;
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
