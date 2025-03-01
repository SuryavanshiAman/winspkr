import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:wins_pkr/plinko/lesson_02/objects/ball_dynamic.dart';

class BoxStatic extends BodyComponent with ContactCallbacks {
  double x;
  double y;
  late Body _body;  // Use late modifier for lazy initialization

  // Constructor that takes x and y positions
  BoxStatic(this.x, this.y);

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      gravityScale: Vector2(0, 10),
      userData: this,
      position: Vector2(x, y),
      // Position set by x and y parameters
      type: BodyType.static,
    );

    final shape = CircleShape()..radius = .20;
    final fixtureDef = FixtureDef(shape)..friction = .05;
    _body = world.createBody(bodyDef)
      ..createFixture(fixtureDef);

    return _body;
  }

  // Override the body getter to return the created body
  @override
  Body get body => _body;

  @override
  void beginContact(Object other, Contact contact) {
    if (other is BallDynamic) {
      // Add your collision handling logic here
    }
  }

  // Method to shift the box downwards by a specified amount
  void shiftDown(double amount) {
    // Update the y position
    y += amount;

    // Update the body's position
    _body.setTransform(Vector2(x, y), _body.angle);
  }
}
