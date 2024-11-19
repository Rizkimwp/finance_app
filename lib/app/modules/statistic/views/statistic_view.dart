import 'package:finace_app/app/model/Chart.dart';
import 'package:finace_app/app/widget/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/statistic_controller.dart';

class StatisticView extends GetView<StatisticController> {
  final StatisticController statisticController =
      Get.put(StatisticController());

  final List<ChartData> chartData = [
    ChartData('Pemasukan', 24),
  ];

  StatisticView({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar opsi tanggal untuk setiap bulan dalam tahun ini
    List<DateTime> dateOptions = List.generate(12, (index) {
      return DateTime(DateTime.now().year, index + 1, 1);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statistik',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Obx(() {
              return Container(
                width: 100, // Tentukan lebar kotak yang lebih kecil
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: 1), // Border kotakan
                  borderRadius:
                      BorderRadius.circular(8), // Radius sudut kotakan
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 7.0), // Padding dalam kotak
                child: DropdownButton<DateTime>(
                  isExpanded:
                      false, // Jangan gunakan isExpanded agar kotak tetap kecil
                  value: dateOptions
                          .contains(statisticController.selectedDate.value)
                      ? statisticController.selectedDate.value
                      : dateOptions[
                          0], // Default ke opsi pertama jika tidak cocok
                  icon: const Icon(Icons.arrow_drop_down),
                  underline: Container(), // Menghilangkan underline bawaan
                  onChanged: (DateTime? newValue) {
                    statisticController.updateDate(newValue);
                  },
                  items: dateOptions.map((date) {
                    return DropdownMenuItem<DateTime>(
                      value: date,
                      child: Text(
                        DateFormat('MMM yyyy').format(date),
                        style: const TextStyle(
                            fontSize: 12), // Ukuran teks lebih kecil
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          ),
        ],
        bottom: TabBar(
          controller: statisticController.tabController,
          tabs: const [
            Tab(text: 'Pemasukan'),
            Tab(text: 'Pengeluaran'),
          ],
        ),
      ),
      body: TabBarView(
        controller: statisticController.tabController,
        children: [
          Column(
            children: [
              Center(
                  child: SfCircularChart(
                legend: Legend(
                  isVisible: false,
                  position: LegendPosition.bottom,
                ),
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                      strokeColor: Colors.green,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.category,
                      yValueMapper: (ChartData data, _) => data.value,
                      pointColorMapper: (ChartData data, _) => Colors.green,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true))
                ],
              )),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    buildTransaction(
                        'Pemasukan',
                        '+Rp2.000.000',
                        'Pendapatan Gajian Perbulan',
                        '10 May 2024',
                        Colors.green),
                    buildTransaction(
                        'Pemasukan',
                        '+Rp2.000.000',
                        'Pendapatan Gajian Perbulan',
                        '10 May 2024',
                        Colors.green),
                    buildTransaction(
                        'Pemasukan',
                        '+Rp2.000.000',
                        'Pendapatan Gajian Perbulan',
                        '10 May 2024',
                        Colors.green),
                    buildTransaction(
                        'Pemasukan',
                        '+Rp2.000.000',
                        'Pendapatan Gajian Perbulan',
                        '10 May 2024',
                        Colors.green),
                    buildTransaction(
                        'Pemasukan',
                        '+Rp2.000.000',
                        'Pendapatan Gajian Perbulan',
                        '10 May 2024',
                        Colors.green),
                    buildTransaction(
                        'Pemasukan',
                        '+Rp2.000.000',
                        'Pendapatan Gajian Perbulan',
                        '10 May 2024',
                        Colors.green),
                  ],
                ),
              ))
            ],
          ),
          Center(child: Text("Konten Pengeluaran")),
        ],
      ),
    );
  }
}
