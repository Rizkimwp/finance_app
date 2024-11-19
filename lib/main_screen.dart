import 'package:finace_app/app/modules/account/views/account_view.dart';
import 'package:finace_app/app/modules/home/views/home_view.dart';
import 'package:finace_app/app/modules/navbar/controllers/nav_controller.dart';
import 'package:finace_app/app/modules/profile/views/profile_view.dart';
import 'package:finace_app/app/modules/statistic/views/statistic_view.dart';
import 'package:finace_app/app/modules/transaction/views/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1), // Navigator dengan nestedKey ID 1
        initialRoute: '/home',
        onGenerateRoute: (routeSettings) {
          return GetPageRoute(
            settings: routeSettings,
            page: () {
              switch (routeSettings.name) {
                case '/home':
                  return HomeView();
                case '/account':
                  return AccountView();
                case '/transaction':
                  return TransactionView();
                case '/statistic':
                  return StatisticView();
                case '/profile':
                  return ProfileView();
                default:
                  return HomeView();
              }
            },
          );
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          onTap: navController.changeTabIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart), label: "Spend"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "Card"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart), label: "Statistic"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
