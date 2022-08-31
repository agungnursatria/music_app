import 'package:flutter/material.dart';

class Helper {
  /// This method [catchError] is used to Prints a message to the
  /// console related to any error found on use
  ///
  static dynamic catchError(
    dynamic exception,
    StackTrace? stackTrace,
  ) {
    debugPrint('Error:\n${exception.toString()}');
    debugPrint('StackTrace:\n${stackTrace.toString()}');
  }

  /// This method [spaceToPlus] is used to replace space character
  /// with plus character on String [query].
  ///
  /// For Example: The query is "Hello World"
  /// And the result will be "Hello+World".
  ///
  /// How to use: just call this method
  /// like replace('Hello World').
  ///
  static String? spaceToPlus(String? query) {
    if (query == null) return null;
    return query.trim().replaceAll(" ", "+");
  }
}
