import 'package:flutter/material.dart';

Widget buildInfo(String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}
