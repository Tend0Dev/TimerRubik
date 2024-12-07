import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_rubik/views/records.dart';
import 'dart:async';
import 'package:timer_rubik/views/scramble.dart';
import 'package:timer_rubik/providers/scramble_providers.dart';
import 'package:timer_rubik/providers/times_providers.dart';

class RubikTimer extends StatefulWidget {
  const RubikTimer({super.key});

  @override
  State<RubikTimer> createState() => _RubikTimerState();
}

class _RubikTimerState extends State<RubikTimer> {
  Timer? _timer;
  double _time = 0.0;
  bool _isRunning = false;
  final Utils utils = Utils();
  String _currentScramble = "";

  @override
  void initState() {
    super.initState();
    _generateNewScramble();
  }

  void _startTimer() {
    final scrambleProvider =
        Provider.of<ScrambleProvider>(context, listen: false);
    scrambleProvider.addScramble(_currentScramble);

    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _time += 0.01;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    final timesProvider = Provider.of<TimesProvider>(context, listen: false);
    _generateNewScramble();
    setState(() {
      _isRunning = false;
      timesProvider.addTime(_time);
      _time = 0.0;
    });
  }

  void _generateNewScramble() {
    setState(() {
      _currentScramble = utils.getScramble();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            _currentScramble,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!_isRunning) {
                  setState(() => _isRunning = true);
                  _startTimer();
                } else {
                  _stopTimer();
                }
              },
              onLongPress: () {
                setState(() => _time = 0.0);
              },
              child: Center(
                child: Text(
                  _time.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 80),
                ),
              ),
            ),
          ),
          const RecordsTimes(), // Pasa la lista de tiempos
        ],
      ),
    );
  }
}
