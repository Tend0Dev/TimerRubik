import 'package:flutter/material.dart';

class ScrambleProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _scramble = [];

  List<Map<String, dynamic>> get scrambles => _scramble;

  void addScramble(String scramble) {
    _scramble.add({
      'scramble': scramble,
    });
    notifyListeners();
  }
}
