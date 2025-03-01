import 'package:flutter/material.dart';
import 'dart:math';

class EasyCartAnimation extends StatefulWidget {
  final Offset? startPosition;
  final Offset? endPosition;
  final Color color;
  final double opacity;
  final double height;
  final double width;
  final double dxCurveAnimation;
  final double dyCurveAnimation;
  final Widget? child;

  const EasyCartAnimation({
    super.key,
    required this.startPosition,
    required this.endPosition,
    this.child,
    this.color = Colors.red,
    this.height = 14,
    this.width = 14,
    this.opacity = 1.0,
    this.dxCurveAnimation = 0,
    this.dyCurveAnimation = 0,
  });

  @override
  _CartAnimationPageState createState() => _CartAnimationPageState();
}

class _CartAnimationPageState extends State<EasyCartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double? left;
  double? top;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    var x0 = widget.startPosition!.dx;
    var y0 = widget.startPosition!.dy;

    var x1 = widget.startPosition!.dx - widget.dxCurveAnimation;
    var y1 = widget.startPosition!.dy - widget.dyCurveAnimation;

    var x2 = widget.endPosition!.dx;
    var y2 = widget.endPosition!.dy;

    _animation.addListener(() {
      var t = _animation.value;
      if (mounted) {
        setState(() {
          left = pow(1 - t, 2) * x0 + 2 * t * (1 - t) * x1 + pow(t, 2) * x2;
          top = pow(1 - t, 2) * y0 + 2 * t * (1 - t) * y1 + pow(t, 2) * y2;
        });
      }
    });

    left = widget.startPosition!.dx;
    top = widget.startPosition!.dy;

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            left: left,
            top: top,
            child: Opacity(
              opacity: widget.opacity,
              child: ClipOval(
                child: Container(
                  width: widget.height,
                  height: widget.width,
                  color: widget.color,
                  child: widget.child ?? const SizedBox.shrink(),
                ),
              ),
            ))
      ],
    );
  }
}