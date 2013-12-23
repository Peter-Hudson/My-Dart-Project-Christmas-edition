library stageclass;

import 'package:stagexl/stagexl.dart';
import 'dart:html' as html;
import 'dart:math' as math;

Stage stage;
ResourceManager resourceManager;
var flowerField;

class Stageclass{
  
    
  Stageclass(){
    stage = new Stage("myStage", html.querySelector('#stage'));  
    buildStar();
    
    resourceManager = new ResourceManager()
    ..addBitmapData('me', 'test.jpg')
    ..load().then((_) {
      flowerField = new FlowerField();
      flowerField.x = 470;
      flowerField.y = 250;
      stage.addChild(flowerField);
    });
  }
  
  buildStar(){
    var starPath = new List<Point>();

    for(int i = 0; i < 6; i++) {
      num a1 = (i * 60) * math.PI / 180;
      num a2 = (i * 60 + 30) * math.PI / 180;
      starPath.add(new Point(470 + 200 * math.cos(a1), 250 + 200 * math.sin(a1)));
      starPath.add(new Point(470 + 100 * math.cos(a2), 250 + 100 * math.sin(a2)));
    }
    var customMask = new Sprite();
    customMask.mask = new Mask.custom(starPath);
    
  }
  
}


class FlowerField extends Sprite {

  FlowerField() {

    this.pivotX = 470;
    this.pivotY = 250;

    // Add 150 rotating flowers to the field.

//  
//      var bitmapData = resourceManager.getBitmapData('me');
//      var bitmap = new Bitmap(bitmapData)
//        ..pivotX = 64
//        ..pivotY = 64
//        ..x = 64 
//        ..y = 64 ;
//
//      addChild(bitmap);
//
//      stage.juggler.tween(bitmap, 600, TransitionFunction.linear)
//        ..animate.rotation.to(math.PI * 60.0);
   }
}