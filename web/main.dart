library blog;

import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:perf_api/perf_api.dart';
import 'package:angular/playback/playback_http.dart';

import 'mymvc.dart';

import 'dart:html';
import 'stageclass.dart';

void main(){
  
  List images = [];  
  
  var st = new Stageclass();
  
  var module = new Module()
  ..type(MymvcController)
  ..type(PlaybackHttpBackendConfig);
  ngBootstrap(module:module);
}

