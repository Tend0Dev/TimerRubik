import 'package:flutter/material.dart';
import 'package:timer_rubik/views/algorithms_oll.dart';
import 'package:timer_rubik/views/algorithms_pll.dart';

class AlgorithmsScreen extends StatelessWidget {
  final String algorithmType;

  const AlgorithmsScreen({super.key, required this.algorithmType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$algorithmType Algorithms'),
      ),
      body: algorithmType == 'PLL' ? AlgorithmsPll() : AlgorithmsOll(),
    );
  }
}
