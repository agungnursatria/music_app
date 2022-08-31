import 'dart:async';

import 'package:flutter/material.dart';

/// [Debouncer] is class with function to give delay before execute an action.
///
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run({required VoidCallback action}) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  stop() {
    _timer?.cancel();
  }
}
