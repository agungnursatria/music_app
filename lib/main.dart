import 'package:flutter/material.dart';
import 'package:music_app/app.dart';
import 'package:music_app/di/injector.dart';

void main() {
  Injector().init();
  runApp(const MyApp());
}
