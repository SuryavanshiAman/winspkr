import 'package:flutter/material.dart';


class DrTiSetting extends StatefulWidget {
  const DrTiSetting({super.key});

  @override
  DrTiSettingState createState() => DrTiSettingState();
}

class DrTiSettingState extends State<DrTiSetting>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool soundEnabled = false;
  bool vibrationEnabled = false;

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
    final screenWidth = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
                                'GAME SETTING',
                                style: TextStyle( fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                    color: Colors.white),
                               ),
                            SizedBox(width: screenWidth * 0.17),
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
                          height: height * 0.27,
                          width: screenWidth,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff292d3b),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff191f2d),
                                    borderRadius: BorderRadius.circular(2)),
                                margin:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 0),
                                height: height * 0.06,
                                width: screenWidth * 0.85,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                           'Sound',
                                          style: TextStyle( fontSize: 16,
                                              color: Colors.white),
                                         ),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    //   child: AdvancedSwitch(
                                    //     onChanged: (value) {
                                    //       setState(() {
                                    //         soundEnabled = value;
                                    //       });
                                    //       if (kDebugMode) {
                                    //         print(
                                    //           'Sound:  ${value ? "ON" : "OFF"}');
                                    //       }
                                    //     },
                                    //     inactiveColor: Colors.black,
                                    //     activeChild: const Text('OFF'),
                                    //     inactiveChild: const Text('ON'),
                                    //     activeColor: const Color(0xff27c5ac),
                                    //     borderRadius: const BorderRadius.all(
                                    //         Radius.circular(15)),
                                    //     width: screenWidth * 0.17,
                                    //     height: 30.0,
                                    //     enabled: true,
                                    //     disabledOpacity: 0.5,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff191f2d),
                                    borderRadius: BorderRadius.circular(2)),
                                margin:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 0),
                                height: height * 0.06,
                                width: screenWidth * 0.85,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                           'Vibration',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white
                                          ),
                                          ),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    //   child: AdvancedSwitch(
                                    //     inactiveColor: Colors.black,
                                    //     activeChild: const Text('OFF'),
                                    //     inactiveChild: const Text('ON'),
                                    //     activeColor: const Color(0xff27c5ac),
                                    //     onChanged: (value) {
                                    //       setState(() {
                                    //         soundEnabled = value;
                                    //       });
                                    //       if (kDebugMode) {
                                    //         print(
                                    //           'Vibration: ${value ? "ON" : "OFF"}');
                                    //       }
                                    //     },
                                    //     borderRadius: const BorderRadius.all(
                                    //         Radius.circular(15)),
                                    //     width: screenWidth * 0.16,
                                    //     height: 30.0,
                                    //     enabled: true,
                                    //     disabledOpacity: 0.5,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ],
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
