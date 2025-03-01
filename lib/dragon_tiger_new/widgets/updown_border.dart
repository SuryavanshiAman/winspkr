import 'package:flutter/material.dart';

class UpDownBorder extends StatefulWidget {
  final double borderWidth;
  final Widget child;
  final Color borerColor;
  const UpDownBorder(
      {super.key,
        required this.borderWidth,
        required this.child,
        required this.borerColor});

  @override
  UpDownBorderState createState() => UpDownBorderState();
}

class UpDownBorderState extends State<UpDownBorder>
    with TickerProviderStateMixin {
  late AnimationController _resizableController;

  AnimatedBuilder getContainer() {
    return AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: widget.borerColor,
                  width: _resizableController.value * widget.borderWidth),
            ),
            child: widget.child,
          );
        });
  }

  @override
  void initState() {
    _resizableController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _resizableController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getContainer();
  }
  @override
  void dispose() {
    _resizableController.dispose();
    super.dispose();
  }
}