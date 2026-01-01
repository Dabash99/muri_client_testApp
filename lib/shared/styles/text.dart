import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ==========================================
// REGULAR WEIGHT STYLES (FontWeight.w400)
// ==========================================

class TextRegularH1 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularH1({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 80,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularH2 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularH2({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 64,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularH3 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularH3({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularH4 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularH4({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularH5 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularH5({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularBodyLarge extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularBodyLarge({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularBodyMedium extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularBodyMedium({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularCaption extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularCaption({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularLabel extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularLabel({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextRegularSmall extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextRegularSmall({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

// ==========================================
// MEDIUM WEIGHT STYLES (FontWeight.w500)
// ==========================================

class TextMediumH1 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumH1({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 80,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class TextMediumH2 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumH2({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 64,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class TextMediumH3 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumH3({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 48,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class TextMediumH4 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumH4({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 40,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class TextMediumH5 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumH5({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class TextMediumBodyLarge extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumBodyLarge({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class TextMediumBodyMedium extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumBodyMedium({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class TextMediumCaption extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumCaption({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class TextMediumLabel extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextMediumLabel({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

// ==========================================
// BOLD WEIGHT STYLES (FontWeight.bold)
// ==========================================

class TextBoldH1 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldH1({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBoldH2 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldH2({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBoldH3 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldH3({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBoldH4 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldH4({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBoldH5 extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldH5({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBoldBodyLarge extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldBodyLarge({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBoldBodyMedium extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldBodyMedium({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBoldCaption extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldCaption({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBoldLabel extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;

  const TextBoldLabel({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.alexandria(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}