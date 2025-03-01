import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:wins_pkr/Plinko/my_game.dart';

class RightWallStatic extends BodyComponent {
  @override
  Body createBody() {
    if (kDebugMode) {
      print(worldSize.x);
    }
    final bodyDef = BodyDef(
      position: Vector2(worldSize.x, worldSize.y - .25),
      type: BodyType.static,
    );

    final shape = PolygonShape()..setAsBoxXY(.05, worldSize.y);
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
