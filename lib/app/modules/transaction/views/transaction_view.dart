import 'package:finace_app/app/widget/card.dart';
import 'package:finace_app/app/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  List<Map<String, dynamic>> cards = [
    {
      "number": "1234 5678 9101 1121",
      "name": "John Doe",
      "expiry": "12/24",
      "colorStart": Colors.purple,
      "colorEnd": Colors.deepPurpleAccent,
    },
    {
      "number": "2345 6789 1011 1213",
      "name": "Jane Smith",
      "expiry": "11/23",
      "colorStart": Colors.orange,
      "colorEnd": Colors.redAccent,
    },
    // Add more cards as needed
  ];

  TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
              padding: EdgeInsets.only(top: 100, bottom: 5),
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 83, 31, 172),
                      Colors.black
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: CardView(cards)),
          Container(
            margin: EdgeInsets.all(15),
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(Size(400, 50)),
              ),
              child: Text('LIHAT DETAIL AKUN'),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
            width: 400,
            decoration: BoxDecoration(
                color: const Color.fromARGB(59, 158, 158, 158),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nomor Kartu',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '0822-22333-21332',
                        style: TextStyle(fontSize: 16, letterSpacing: 3),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: '081223-223231-231323'));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Nomor Kartu Sudah Disalin')));
                        },
                        icon: Icon(Icons.copy))
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text(
                    'Tambah Card',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ), // Icon untuk menambah ikon "Tambah" di sebelah kiri teks
                  backgroundColor: Colors.deepPurpleAccent,
                ),
              ],
            ),
          )
        ]));
  }
}
