// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:wins_pkr/main.dart';



class HowToPlay extends StatefulWidget {
  const HowToPlay({super.key});

  @override
  _HowToPlayState createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
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
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Opacity(
                opacity: _animation.value,
                child: Transform.scale(
                  scale: _animation.value,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'HOW TO PLAY',
                              style: TextStyle(fontWeight: FontWeight.w900,
                                  fontSize: 22,
                                  color: Colors.white),

                            ),
                            SizedBox(width: width * 0.17),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: width,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color(0xff292d3b),
                          ),
                          child: Container(
                            height: height * 0.7,
                            width: width,
                            margin: const EdgeInsets.all(1),
                            padding: const EdgeInsets.fromLTRB(5, 0, 3, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff191f2d),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                const Text('Card Type Compare:',style:TextStyle(color: Color(0xfff8e724),fontSize: 16)),
                                const Text('1. The card are compared with the point first,then the suits;',style:TextStyle(color: Colors.white,fontSize: 15)),
                                const Text('2. The number of point ranges from A to K is the min,K is the max,\n(K>Q>J>10>9>8>7>6>5>4>3>2>A),\n(♠>♥>♣>♦);',style:TextStyle(color: Colors.white,fontSize: 15)),
                                const Text('3. To predict the size of the dragon and tiger before dealing,you can bet on the three zones of "dragon"  "tiger" and "tie";',style:TextStyle(color: Colors.white,fontSize: 15)),
                                const Text('4. When the card is opened , the croupier will first send one card to the Dragon area and the another the tiger area. The one with the biggest card wins.',style:TextStyle(color: Colors.white,fontSize: 15)),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                const Text( 'Betting Area:',style:TextStyle(color: Color(0xfff8e724),fontSize: 16)),
                                const Text( '1 Dragon: 1: 1 (tie full refund)',style:TextStyle(color: Colors.white,fontSize: 15)),
                                const Text( '2 Tiger:     1: 1 (tie full refund)',style:TextStyle(color: Colors.white,fontSize: 15)),
                                const Text( '3 Tie:  1: 8 ',style:TextStyle(color: Colors.white,fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
