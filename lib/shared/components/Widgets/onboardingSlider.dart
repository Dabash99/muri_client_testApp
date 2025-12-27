import 'package:flutter/material.dart';

Widget buildDot({required bool isActive}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: isActive ? 30 : 10,
    height: 6,
    decoration: BoxDecoration(
      color: isActive ? const Color(0xFF2D7FF9) : Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
