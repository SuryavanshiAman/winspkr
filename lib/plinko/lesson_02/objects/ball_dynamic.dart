import 'dart:math';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wins_pkr/plinko/lesson_02/objects/floor_static.dart';
import 'package:wins_pkr/plinko/lesson_02/objects/object_state.dart';
import 'box_static.dart';

class BallDynamic extends BodyComponent with ContactCallbacks {
  ObjectState state = ObjectState.normal;
  final speed = Vector2(10, 0);
  Paint _ballPaint = BasicPalette.red.paint(); // Call the paint function

  BallDynamic(Color color) {
    _ballPaint = Paint()..color = color;
  }

  @override
  Paint get paint => _ballPaint;

  @override
  set paint(Paint value) {
    _ballPaint = value;
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      // linearVelocity: speed,
      userData: this,
      position: Vector2(6.55, 0),
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = .24;
    final fixtureDef = FixtureDef(shape)
      ..density = .15
    //05
      ..friction = .20
    //005
      ..restitution = .70; // Increase this value for more bounce
    //070
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  void hit() {
    if (state == ObjectState.normal) {
      state = ObjectState.explode;
      if (kDebugMode) {
        print(hit);
        print('kaha hit ho ra hai');
      }

    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (state == ObjectState.explode) {
      world.destroyBody(body);
      gameRef.remove(this);
    }
    if (kDebugMode) {
      print("Ball position: ${body.position}");
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(body.position.toOffset(), 0.0, _ballPaint);
    if (kDebugMode) {
      print(_ballPaint);
      print('_ballPaint');
    }

  }

  @override
  void endContact(Object other, Contact contact) {
    if (kDebugMode) {
      print(endContact);
      print('endContact');
    }
    if (other is BoxStatic) {
      final rand = Random();
      if (kDebugMode) {
        print(Random);
        print('kaha hoo');
      }
      int random = rand.nextInt(2);
      if (kDebugMode) {
        print(random);
      }
      var speed = Vector2(-1, 0);

      if (random == 0) {
        speed = Vector2(0.5, 0);
      } else {
        speed = Vector2(-0.6, 0);
        if (kDebugMode) {
          print(Vector2);
          print('Vector2');
        }
      }
      body.linearVelocity = speed;
      if (kDebugMode) {
        print("BOX STATIC CONTACT");
      }
    }
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (kDebugMode) {
      print(beginContact);
      print('beginContact');
    }

    if (other is FloorStatic) {
      hit();
      if (kDebugMode) {
        print(hit);
        print('hit');
        print(FloorStatic);
        print('FloorStatic');
      }

    }
  }
}



// import 'dart:math';
// import 'package:flame_forge2d/flame_forge2d.dart';
// import 'package:flutter_plinko/lesson_02/objects/box_static.dart';
// import '../../lesson_02/objects/object_state.dart';
// import 'floor_static.dart';
// class BallDynamic extends BodyComponent with ContactCallbacks {
//   ObjectState state = ObjectState.normal;
//   final speed = Vector2(2, 0);
//   @override
//   Body createBody() {
//     final bodyDef = BodyDef(
//       // linearVelocity: speed,
//       userData: this,
//       position: Vector2(6.2, 0),
//       type: BodyType.dynamic,
//     );
//     final shape = CircleShape()..radius = .24;
//     final fixtureDef = FixtureDef(shape)
//       ..density = .05
//       ..friction = .005
//       ..restitution = .055;
//     return world.createBody(bodyDef)..createFixture(fixtureDef);
//   }
//   void hit() {
//     if (state == ObjectState.normal) {
//       state = ObjectState.explode;
//     }
//   }
//   @override
//   void update(double dt) {
//     super.update(dt);
//     if (state == ObjectState.explode) {
//       world.destroyBody(body);
//       gameRef.remove(this);
//     }
//   }
//   @override
//   void endContact(Object other, Contact contact) {
//     if(other is BoxStatic) {
//       //  ball direction by pankaj
//       final rand = Random();
//       int random = rand.nextInt(2);
//       print(random);
//       var speed = Vector2(-1, 0);
//       if(random == 0) {
//         speed = Vector2(1, 0);
//       }
//       else {
//         speed = Vector2(-1, 0);
//       }
//       body.linearVelocity = speed;
//       print("BOX STATIC CONTACT");
//     }
//   }
//   @override
//   void beginContact(Object other, Contact contact) {
//     if (other is FloorStatic) {
//       hit();
//     }
//   }
// }