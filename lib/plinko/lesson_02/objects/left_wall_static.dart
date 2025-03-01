import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:wins_pkr/Plinko/my_game.dart';

class LeftWallStatic extends BodyComponent {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(0, 10),
      type: BodyType.static,
    );

    // final shape = EdgeShape()..set(Vector2.zero(), Vector2(worldSize.x, -2500));
    final shape = PolygonShape()..setAsBoxXY(.05, worldSize.y);
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
