import 'dart:ui';
import 'dart:math';
import 'dart:collection';
import 'dart:io';

import 'package:little_fme/my-game.dart';
import 'package:little_fme/pantalla-mix.dart';
import 'package:little_fme/pantalla-add.dart';
import 'package:little_fme/pantalla-details.dart';
import 'package:little_fme/components/icona.dart';
import 'package:little_fme/components/my-element.dart';
import 'package:little_fme/components/recipe.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/flame.dart';

import 'package:path_provider/path_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PantallaDetails {
  final MyGame game;

  PantallaDetails(this.game) {}

  void render(Canvas canvas) {
    Paint _black = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Rect bgRect = Rect.fromLTWH(
        2*game.pad, 2*game.pad, game.screenSize.width - 4 * game.pad, game.screenSize.height - 2 * game.pad);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffeeeeee);
    canvas.drawRect(bgRect, bgPaint);

    canvas.drawCircle(
        Offset(game.screenSize.width - 4 * game.pad, 4*game.pad),
        game.pad-1, _black);

    bgRect = Rect.fromLTWH(
      game.screenSize.width/2 - game.bigtile/2,
      6*game.pad,
      game.bigtile,
      game.bigtile,
    );
    game.detailsShow.img.renderRect(canvas, bgRect);
    TextSpan span = new TextSpan(
        style: new TextStyle(fontSize: 2*game.pad, color: Color(0xff000000)),
        text: game.detailsShow.name);
    TextPainter tp = new TextPainter(
        text: span, textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(3*game.pad, 6*game.pad + game.bigtile + 1*game.pad));

    span = new TextSpan(
        style: new TextStyle(fontSize: game.pad, color: Color(0xff000000)),
        text: game.detailsShow.desc);
    tp = new TextPainter(
        text: span, textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(3*game.pad, 6*game.pad + game.bigtile + 4*game.pad));

    if (game.detailsShow.A != null) {
      game.detailsShow.A.showRecipe(game.bigtile + 12*game.pad, canvas);
    }
    if (game.detailsShow.B != null) {
      game.detailsShow.B.showRecipe(game.bigtile + 13.5*game.pad + game.recipetile, canvas);
    }
    if (game.detailsShow.C != null) {
      game.detailsShow.C.showRecipe(game.bigtile + 15*game.pad + 2*game.recipetile, canvas);
    }
  }
}