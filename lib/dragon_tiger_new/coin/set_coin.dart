import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wins_pkr/generated/assets.dart';


class CoinSpringAnimation extends StatefulWidget {
  const CoinSpringAnimation({super.key});

  @override
  CoinSpringAnimationState createState() => CoinSpringAnimationState();
}

class CoinSpringAnimationState extends State<CoinSpringAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationX;
  late Animation<double> _animationY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationX = Tween<double>(
      begin: 0,
      end: 60,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _animationY = Tween<double>(
      begin: 10,
      end: 60,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
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
          offset: Offset(_animationX.value, -_animationY.value),
          child: child,
        );
      },
      child: _buildCoin(),
    );
  }

  Widget _buildCoin() {
    Random random = Random();
    List<int> possibleNumbers = [5, 10, 50, 100];
    int randomNumberIndex = random.nextInt(possibleNumbers.length);
    int otherData = possibleNumbers[randomNumberIndex];
    return coinsDesign(otherData);
  }
  Widget coinsDesign(int otherData) {
    String imageUrl = '';
    Color color = Colors.red;
    if (otherData == 5) {
      imageUrl = Assets.chips50;
    } else if (otherData == 10) {
      imageUrl = Assets.chips100;
    } else if (otherData == 50) {
      imageUrl = Assets.chips500;
    } else {
      imageUrl = Assets.chips1000;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 15,
        backgroundImage: AssetImage(
          imageUrl,
        ),
      ),
    );
  }
}
