library stageclass;

import 'package:stagexl/stagexl.dart';
import 'dart:html' as html;
import 'dart:math' as math;

List friends;
List renderedFriends;
Stage stage;
ResourceManager resourceManager;
var flowerField;
RenderLoop renderLoop;
var star;
String myimage;
List ballballs = [
                  {'height':100,'width':100,'circum':100,'x':194,'y':298},
                  {'height':100,'width':100,'circum':100,'x':408,'y':298},
                  {'height':100,'width':100,'circum':100,'x':303,'y':385},
                  {'height':100,'width':100,'circum':100,'x':108,'y':484},
                  {'height':100,'width':100,'circum':100,'x':301,'y':536},
                  {'height':100,'width':100,'circum':100,'x':495,'y':484}
                  ];

List color_list = [Color.CornflowerBlue,Color.AliceBlue,Color.BlueViolet,Color.Crimson,Color.Firebrick,Color.ForestGreen];

class Stageclass{
      
  Stageclass(String myimage, List friends){
    stage = new Stage("myStage", html.querySelector('#stage'));
    renderLoop = new RenderLoop();
    renderLoop.addStage(stage);
    
    buildStar();
    
    resourceManager = new ResourceManager()
    ..addBitmapData('tree', 'christmas-tree.svg')
    ..addBitmapData('me', myimage)     
      ..load().then((_) {      
        var christmastree = new Bitmap(resourceManager.getBitmapData('tree'));
        christmastree.x = 0;
        christmastree.y = 0;
        stage.addChild(christmastree);
        
        var fbprofile = new Bitmap(resourceManager.getBitmapData('me'));
        fbprofile.x = 250;
        fbprofile.y = 0;
        fbprofile.mask = star;
        stage.addChild(fbprofile);
      });
    
    var circleMask = new Mask.circle(100, 100, 100);
    for(var cf=0; cf<friends.length;cf++){
      var temp_friend = friends[cf];
      resourceManager
      ..addBitmapData('friend${cf}', temp_friend)
      ..load().then((_) {       
       
              
          var f1 = new Bitmap(resourceManager.getBitmapData('friend${cf}'));
          f1.width = ballballs[cf]['width'];
          f1.height = ballballs[cf]['height'];
          f1.x = ballballs[cf]['x'];
          f1.y = ballballs[cf]['y'];
          f1.mask = circleMask;
          
          stage.addChild(f1);
          var ff = new GlowFilter(color_list[cf],0.6);
          var shape = new Shape();
          shape.graphics.circle(ballballs[cf]['x']+50, ballballs[cf]['y']+50, 50);
          
          
          
//          shape.graphics.fillStyle(color_list[cf]);
          
          
          
          stage.addChild(shape);
          
//          renderedFriends.add(f1);
        
        });
    }
    
    
  }
  
  buildStar(){
    var starPath = new List<Point>();

    for(int i = 0; i < 6; i++) {
      num a1 = (i * 60) * math.PI / 180;
      num a2 = (i * 60 + 30) * math.PI / 180;
      starPath.add(new Point(102 + 100 * math.cos(a1), 90+100 * math.sin(a1)));
      starPath.add(new Point(102 + 52 * math.cos(a2), 90+52 * math.sin(a2)));
    }
    
      star = new Mask.custom(starPath);
//    stage.addChild(customMask);
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