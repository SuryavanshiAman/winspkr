import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'package:wins_pkr/Plinko/my_game.dart';
import 'package:flutter/material.dart';

/// A class representing a static separator in the game, which extends BodyComponent
/// and uses ContactCallbacks for collision handling.
class SeparatorStatic extends BodyComponent with ContactCallbacks {
  final double x;
  final Paint _separatePaint;
  static double? previousX; // Static variable to keep track of the previous separator's position
  static const double gap = 1.42; // Space between separators

  /// Constructor with default red color
  SeparatorStatic.withX(this.x) : _separatePaint = BasicPalette.red.paint();

  /// Constructor with specified color
  SeparatorStatic.withColor(this.x, Color color) : _separatePaint = Paint()..color = color;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    for (final fixture in body.fixtures) {
      final shape = fixture.shape;
      if (shape is PolygonShape) {
        final vertices = shape.vertices;
        final path = Path()..addPolygon(vertices.map((v) => Offset(v.x, v.y)).toList(), true);
        canvas.drawPath(path, _separatePaint);
      }
    }
  }

  @override
  Body createBody() {
    // Adjust the x position to maintain a gap between separators
    final adjustedX = (previousX == null) ? x : previousX! + gap;

    // Define the body with a static type and position adjusted for the separator
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(adjustedX, worldSize.y - 0.15), // Adjusted to shift downwards
      type: BodyType.static,
    );

    // Create the shape and fixture definition for the body
    final shape = PolygonShape()..setAsBoxXY(.02, 1.7);
    final fixtureDef = FixtureDef(shape);

    // Print the position of each separator

    // Print the position of the first separator or the midpoint between separators
    if (previousX == null) {
      // This is the first separator
    } else {
      // Calculate and print the midpoint
      final midpointX = (previousX! + adjustedX) / 2;
    }

    // Update previousX to the current adjusted x
    previousX = adjustedX;

    // Create the body in the world and attach the fixture
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
