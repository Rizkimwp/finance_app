import 'package:flutter/material.dart';

Widget TransactionCard(IconData icon, String text) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.purple[200],
          shape: BoxShape.circle,
        ),
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w400),
      )
    ],
  );
}
