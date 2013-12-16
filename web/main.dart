library blog;

import 'package:di/di.dart';
import 'package:angular/angular.dart';
//import 'package:angular/playback/playback_http.dart';

import 'mymvc.dart';

import 'dart:html';
import 'dart:js' show context, JsObject;

var paper;
var image;
var image2;

void main() {
  
  
  final Snap = context['Snap'];
  paper = new JsObject(Snap, ['#svg']);
//  test.callMethod('circle',[200,200,100]);
  Snap.callMethod('load',['christmas-tree.svg', (e){
    var tree = e.callMethod('select',['#svg3025']);
    var star = e.callMethod('select',['#starsvg']);
    var ballball1 = e.callMethod('select',['#ballball1']);
//    Snap.callMethod('load',['star.svg',(f){
//      var sg = f.callMethod('select',['#svg2']);
      image = paper.callMethod('image',['https://fbcdn-profile-a.akamaihd.net/hprofile-ak-frc3/c210.0.540.540/s200x200/1468585_10151831930897423_1727857692_n.jpg',232,0,220,220]);
//      image.callMethod('drag',[]);
      var scoped = new JsObject.jsify({
//        'cx':100,
//        'cy':100,
//        'mask':image,
        'fill': "r()#fef",
//          'opacity': 0.9
      });
      
      var m = Snap.callMethod('Matrix',[]);
//      var gg2 = paper.callMethod('circle',[300,100,100]);

      var yy = [1100,100];
      var ppp = new JsObject.jsify({
        'mask':star,
        'fill':'none',
//        'transform':'t{$yy}'
      });
      var ppp2 = new JsObject.jsify({
//        'mask':ballball1,
        'fill':'#000',
//        'transform':'t{$yy}'
      });
      image2 = paper.callMethod('image',['https://fbcdn-profile-a.akamaihd.net/hprofile-ak-frc3/c210.0.540.540/s200x200/1468585_10151831930897423_1727857692_n.jpg',200,200,220,220]);
      image.callMethod('attr',[ppp]);
      image2.callMethod('attr',[ppp2]);
      star.callMethod('attr',[scoped]);
      ballball1.callMethod('attr',[scoped]);
      print(ballball1);
//      print('I am $tt');
//      m.callMethod('translate',[300,0]);
//      sg.callMethod('transform',[m]);
//      var ff = sg.callMethod('attr',[scoped]);

//      image.callMethod('attr',[scoped]);
//      var c = g.callMethod('select',['#layer1']);
//      g.callMethod('append',[gg]);
//      print('I am $c');
//      g.callMethod('append',[pree]);
//    }]);
//      g.callMethod('append',[pree]);
    paper.callMethod('prepend',[tree]);
  }]);

  
  
    
}

