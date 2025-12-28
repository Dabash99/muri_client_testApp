import 'package:flutter/material.dart';

class BackArrowBox extends StatelessWidget {
  final VoidCallback onPressed;

  final IconData icon;

  const BackArrowBox({
    super.key,
    required this.onPressed,
    this.icon = Icons.arrow_forward_ios, // الأيقونة الافتراضية
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 16, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}