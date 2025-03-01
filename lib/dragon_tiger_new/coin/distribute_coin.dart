import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wins_pkr/dragon_tiger_new/coin/set_coin.dart';

class AnimatedCoin extends StatefulWidget {
  final int type;


  const AnimatedCoin({super.key, required this.type});
  @override
  AnimatedCoinState createState() => AnimatedCoinState();
}

class AnimatedCoinState extends State<AnimatedCoin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    if (widget.type == 1) {
      _animation = Tween<Offset>(
        begin: const Offset(385, 275),
        end: _randomOffset(100, 200, 100, 200),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOutBack,
        ),
      );
    } else if (widget.type == 2) {
      _animation = Tween<Offset>(
        begin: const Offset(210, 275),
        end: _randomOffset(100, 200, 100, 200),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOutBack,
        ),
      );
    } else {
      _animation = Tween<Offset>(
        begin: const Offset(355, 410),
        end: _randomOffset(100, 325, 50, 100),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOutBack,
        ),
      );
    }
      _controller.forward();
  }




  doubleFun(double start, double end) {
    Random random = Random();

    return start + random.nextDouble() * (end - start);
  }

  Offset _randomOffset(double start, double end, double startX, double endY) {
    double randomPositionX = doubleFun(start, end);
    double randomPositionY = doubleFun(startX, endY);
    return Offset(randomPositionX, randomPositionY);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value,
          child:  const CoinSpringAnimation(),
        );
      },
    );
  }
}
