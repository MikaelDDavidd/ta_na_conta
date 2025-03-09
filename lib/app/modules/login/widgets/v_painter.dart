import 'package:flutter/material.dart';

class VPatternPainter extends CustomPainter {
  final Color color;
  final TextStyle textStyle;

  VPatternPainter({required this.color, required this.textStyle});

  @override
  void paint(Canvas canvas, Size size) {
    // Create a TextSpan for the letter "v"
    final textSpan = TextSpan(text: 'v', style: textStyle.copyWith(color: color));
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final double textWidth = textPainter.width;

    // Draw "v" repeatedly along the top edge.
    double startX = 0;
    while (startX < size.width) {
      textPainter.paint(canvas, Offset(startX, 0));
      startX += textWidth;
    }

    // Draw "v" repeatedly along the bottom edge.
    startX = 0;
    while (startX < size.width) {
      textPainter.paint(canvas, Offset(startX, size.height - textPainter.height));
      startX += textWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
