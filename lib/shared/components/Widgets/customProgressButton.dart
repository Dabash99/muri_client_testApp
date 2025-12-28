// هذا الكود يوضع داخل ملف customProgressButton.dart
import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class CustomProgressButton extends StatelessWidget {
  final double percentage;
  final VoidCallback onPressed;

  const CustomProgressButton({
    super.key,
    required this.percentage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            value: percentage,
            strokeWidth: 3,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.primaryBlue,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}





