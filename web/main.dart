library blog;

import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/playback/playback_http.dart';

import 'mymvc.dart';

import 'dart:html';
import 'dart:js' show context, JsObject;

var test;

void main() {
  
  
  final Snap = context['Snap'];
  test = new JsObject(Snap, ['#svg']);
//  test.callMethod('circle',[200,200,100]);
  Snap.callMethod('load',['christmas-tree.svg', (e){
    var g = e.callMethod('select',['#svg3025']);
    Snap.callMethod('load',['star.svg',(f){
      var scoped = new JsObject.jsify({
        'x1':100,
        'y1':100
      }); 
      var sg = f.callMethod('select',['#svg2']);
      g.callMethod('append',[sg]);
    }]);
    test.callMethod('append',[g]);
  }]);

  
  
    
}

