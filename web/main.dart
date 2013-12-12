library blog;

import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/playback/playback_http.dart';

import 'mymvc.dart';

import 'dart:html';
import 'dart:js' show context, JsObject;

void main() {
  
  final Snap = context['Snap'];
  var test = new JsObject(Snap, ['#svg']);
  test.callMethod('circle',[200,200,100]);
  
}