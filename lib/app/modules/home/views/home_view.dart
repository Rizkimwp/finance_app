import 'package:finace_app/app/modules/home/controllers/home_controller.dart';
import 'package:finace_app/app/widget/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              // Replace with your avatar asset
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Rizky!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 0),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color.fromARGB(255, 83, 31, 172), Colors.black],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      // Balance Card
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'SALDO ANDA',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rp30,000,000',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.visibility, color: Colors.grey),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildActionButton(
                                    Icons.arrow_downward, 'Income'),
                                _buildActionButton(
                                    Icons.arrow_upward, 'Outcome'),
                                _buildActionButton(
                                    Icons.trending_up, 'Investasi'),
                                _buildActionButton(
                                    Icons.account_balance_wallet, 'E-Wallet'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Analysis Card
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.analytics, color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Ayo cek Analisis Keuangan kamu pada bulan Juni!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          'Transaksi Terbaru',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
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
                        buildTransaction('Pengeluaran', '-Rp2.000.000',
                            'Beli Susu Anak', '10 May 2024', Colors.red),
                        buildTransaction('Pengeluaran', '-Rp2.000.000',
                            'Beli Susu Anak', '10 May 2024', Colors.red),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple[200],
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
