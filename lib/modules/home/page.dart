// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app/modules/home/initiator.dart';
import 'package:music_app/modules/home/views/view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeInitiator _i;

  @override
  void initState() {
    super.initState();
    _i = HomeInitiator();
  }

  @override
  void dispose() {
    _i.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
