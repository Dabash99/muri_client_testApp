import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';

class textBold extends StatelessWidget {
  final String label;

   textBold({
    super.key,
     required this.label
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.right,
      style: GoogleFonts.alexandria(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class textreg extends StatelessWidget {
  final String label;

  textreg({
    super.key,
    required this.label
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.right,
      style: GoogleFonts.alexandria(
        fontSize: 14,
        color: AppColors.textSecondary,
        height: 1.5,
      ),
    );
  }
}