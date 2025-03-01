import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double animationValue;

  MyPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final path = drawPath(size.width, size.height, animationValue);

    final paint = Paint()
      ..color = Colors.redAccent.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.red.shade900 // Change border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0; // Change border width

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Path drawPath(double canvasWidth, double chartHeight, double animationValue) {
  final path = Path();
  final segmentWidth = canvasWidth / 2 / 2;
  path.moveTo(0, chartHeight);
  path.cubicTo(
    segmentWidth,
    chartHeight,
    4 * segmentWidth,
    80,
    canvasWidth,
    0,
  );
  path.lineTo(canvasWidth, chartHeight);
  path.close();

  return path;
}
