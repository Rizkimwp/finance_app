import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildTransaction(
    String type, String amount, String description, String date, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Icon(type == 'Pemasukan' ? Icons.arrow_downward : Icons.arrow_upward,
            color: color),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(type,
                style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            Text(description),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(amount,
                style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            Text(date, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    ),
  );
}
