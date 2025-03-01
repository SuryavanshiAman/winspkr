import 'package:flame_forge2d/flame_forge2d.dart';

class BalanceStatic extends BodyComponent {
  BalanceStatic();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(2, 10),
      type: BodyType.static,
    );

    final shape = CircleShape()..radius = .20;

    final fixtureDef = FixtureDef(shape)..friction = .05;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
    // ..angularVelocity = radians(180);
  }
}
