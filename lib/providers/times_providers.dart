import 'package:flutter/material.dart';

class TimesProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _times = [];

  List<Map<String, dynamic>> get times => _times;

  void addTime(double time) {
    _times.add({
      'time': time.toStringAsFixed(2),
    });
    notifyListeners();
  }
}
