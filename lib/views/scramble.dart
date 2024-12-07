import 'package:flutter/material.dart';
import 'dart:math';

class Utils {
  final List<String> moves = ["F", "U", "R", "D", "L", "B"];
  final List<String> types = [" ", "2", "'"];
  final Random random = Random();

  String getScramble() {
    List<String> scramble = [];
    int numberOfMoves = 20;
    String? lastMove;
    String? lastAxis;

    for (int i = 0; i < numberOfMoves; i++) {
      String nextMove = getRandomMove(lastMove, lastAxis);
      scramble.add(nextMove + getRandomType());

      lastMove = nextMove;
      lastAxis = getAxis(nextMove);
    }

    return scramble.join(" ");
  }

  String getRandomMove(String? lastMove, String? lastAxis) {
    String next = moves[random.nextInt(moves.length)];
    String nextAxis = getAxis(next);

    if (next == lastMove || nextAxis == lastAxis) {
      return getRandomMove(lastMove, lastAxis);
    }

    return next;
  }

  String getRandomType() {
    return types[random.nextInt(types.length)];
  }

  String getAxis(String move) {
    if (move == "U" || move == "D") return 'y';
    if (move == "F" || move == "B") return 'z';
    if (move == "L" || move == "R") return 'x';
    throw ArgumentError("Invalid move: $move");
  }
}

class Scramble extends StatefulWidget {
  const Scramble({super.key});

  @override
  State<Scramble> createState() => _ScrambleState();
}

class _ScrambleState extends State<Scramble> {
  final Utils utils = Utils(); // Instanciamos la clase Utils

  @override
  Widget build(BuildContext context) {
    return Text(utils.getScramble());
  }
}
