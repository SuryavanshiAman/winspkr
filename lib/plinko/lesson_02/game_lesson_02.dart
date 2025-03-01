import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/Plinko/lesson_02/objects/balance_hud.dart';
import 'package:wins_pkr/Plinko/lesson_02/objects/separator_static.dart';
import 'package:wins_pkr/Plinko/my_game.dart';
import 'package:wins_pkr/plinko/lesson_02/objects/box_static.dart';
import 'package:wins_pkr/plinko/lesson_02/objects/floor_static.dart';


class PlinkoMains extends MyGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    hud = MyTextBox(
      'Balance: 0',
      align: Anchor.center,
      size: Vector2(400, 700),
      timePerChar: 0,
      margins: .2,
    )
      ..positionType = PositionType.viewport
      ..position = Vector2(400, 890);



    add(SeparatorStatic.withColor(1, const Color(0xFF117ea7)));
    add(SeparatorStatic.withColor(2, const Color(0xFF117ea7)));
    add(SeparatorStatic.withColor(3, const Color(0xFF009aa2)));
    add(SeparatorStatic.withColor(4, const Color(0xFF01a4a1)));
    add(SeparatorStatic.withColor(5, const Color(0xFF01a4a1)));
    add(SeparatorStatic.withColor(6, const Color(0xFF19a99f)));
    add(SeparatorStatic.withColor(7, const Color(0xFF117ea7)));
    add(SeparatorStatic.withColor(8, const Color(0xFF117ea7)));
    add(SeparatorStatic.withColor(9, const Color(0xFF117ea7)));

    // add(SeparatorStatic(4));

    for (var i = 1; i <= 9; i++) {
      add(SeparatorStatic.withColor(i.toDouble(), Colors.transparent));
    }


    // Ensure the FloorStatic is added to the game
    add(FloorStatic(color: Colors.red));
    // add(LeftWallStatic());
    // add(RightWallStatic());

    // add(BoxStatic(6, 2));
    // add(BoxStatic(7, 2));

    add(BoxStatic(5.5, 7));
    add(BoxStatic(6.5, 7));
    add(BoxStatic(7.5, 7));

    add(BoxStatic(5, 8));
    add(BoxStatic(6, 8));
    add(BoxStatic(7, 8));
    add(BoxStatic(8, 8));

    add(BoxStatic(4.5, 9));
    add(BoxStatic(5.5, 9));
    add(BoxStatic(6.5, 9));
    add(BoxStatic(7.5, 9));
    add(BoxStatic(8.5, 9));

    add(BoxStatic(4, 10));
    add(BoxStatic(5, 10));
    add(BoxStatic(6, 10));
    add(BoxStatic(7, 10));
    add(BoxStatic(8, 10));
    add(BoxStatic(9, 10));

    add(BoxStatic(3.5, 11));
    add(BoxStatic(4.5, 11));
    add(BoxStatic(5.5, 11));
    add(BoxStatic(6.5, 11));
    add(BoxStatic(7.5, 11));
    add(BoxStatic(8.5, 11));
    add(BoxStatic(9.5, 11));

    add(BoxStatic(3, 12));
    add(BoxStatic(4, 12));
    add(BoxStatic(5, 12));
    add(BoxStatic(6, 12));
    add(BoxStatic(7, 12));
    add(BoxStatic(8, 12));
    add(BoxStatic(9, 12));
    add(BoxStatic(10, 12));

    add(BoxStatic(2.5, 13));
    add(BoxStatic(3.5, 13));
    add(BoxStatic(4.5, 13));
    add(BoxStatic(5.5, 13));
    add(BoxStatic(6.5, 13));
    add(BoxStatic(7.5, 13));
    add(BoxStatic(8.5, 13));
    add(BoxStatic(9.5, 13));
    add(BoxStatic(10.5, 13));

    add(BoxStatic(2, 14));
    add(BoxStatic(3, 14));
    add(BoxStatic(4, 14));
    add(BoxStatic(5, 14));
    add(BoxStatic(6, 14));
    add(BoxStatic(7, 14));
    add(BoxStatic(8, 14));
    add(BoxStatic(9, 14));
    add(BoxStatic(10, 14));
    add(BoxStatic(11, 14));

    add(BoxStatic(1.5, 15));
    add(BoxStatic(2.5, 15));
    add(BoxStatic(3.5, 15));
    add(BoxStatic(4.5, 15));
    add(BoxStatic(5.5, 15));
    add(BoxStatic(6.5, 15));
    add(BoxStatic(7.5, 15));
    add(BoxStatic(8.5, 15));
    add(BoxStatic(9.5, 15));
    add(BoxStatic(10.5, 15));
    add(BoxStatic(11.5, 15));

    add(BoxStatic(1, 16));
    add(BoxStatic(2, 16));
    add(BoxStatic(3, 16));
    add(BoxStatic(4, 16));
    add(BoxStatic(5, 16));
    add(BoxStatic(6, 16));
    add(BoxStatic(7, 16));
    add(BoxStatic(8, 16));
    add(BoxStatic(9, 16));
    add(BoxStatic(10, 16));
    add(BoxStatic(11, 16));
    add(BoxStatic(12, 16));


  }
}



