import 'package:flutter/material.dart';
import 'package:music_app/app.dart';
import 'package:music_app/config/environment/env.dart';
import 'package:music_app/di/injector.dart';

void main() {
  Injector().init();
  Env().initEnv();
  runApp(const MyApp());
}
