library blog;

import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:perf_api/perf_api.dart';
import 'package:angular/playback/playback_http.dart';

import 'mymvc.dart';

import 'dart:html';
import 'stageclass.dart';

void main(){
  
  List images = ['https://graph.facebook.com/peterhhudson/picture?width=200&height=200','https://graph.facebook.com/peterhhudson/picture?width=200&height=200','https://graph.facebook.com/peterhhudson/picture?width=200&height=200','https://graph.facebook.com/peterhhudson/picture?width=200&height=200'];  
  var st = new Stageclass('https://graph.facebook.com/peterhhudson/picture?width=200&height=200',images);
  
  

  var module = new Module()
  ..type(MymvcController)
  ..type(PlaybackHttpBackendConfig);
  ngBootstrap(module:module);
}

