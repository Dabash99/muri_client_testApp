import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80); // ابدأ من اليسار واترك مسافة من الأسفل

    var firstControlPoint = Offset(size.width / 2, size.height + 40); // نقطة التحكم في المنتصف لأسفل
    var firstEndPoint = Offset(size.width, size.height - 80); // نقطة النهاية في اليمين

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0); // ارسم خط للأعلى
    path.close(); // أغلق المسار
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  }