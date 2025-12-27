import 'package:flutter/material.dart';

class CustomProgressButton extends StatelessWidget {
  const CustomProgressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // الحلقة الخارجية (مؤشر التقدم)
        SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            value: 0.35,
            strokeWidth: 2,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2D7FF9)),
          ),
        ),
        //
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Color(0xFF2D7FF9),
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
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}