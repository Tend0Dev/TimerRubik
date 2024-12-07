import 'package:flutter/material.dart';
import 'package:timer_rubik/widgets/card_algorithms.dart';

class AlgorithmsOll extends StatelessWidget {
  AlgorithmsOll({super.key});

  final List<Map<String, String>> ollCases = [
    {'image': 'assets/1.png', 'scramble': 'R2 U R U R\' U\' R\' U\' R\' U R\''},
    {'image': 'assets/2.png', 'scramble': 'R U\' R U R U R U\' R\' U\' R2'},
    {'image': 'assets/4.png', 'scramble': 'M2 U M2 U2 M2 U M2'},
    {'image': 'assets/5.png', 'scramble': 'x R\' U R\' D2 R U\' R\' D2 R2 x\''},
    {'image': 'assets/6.png', 'scramble': 'x R2 D2 R U R\' D2 R U\' R x\''},
    {
      'image': 'assets/7.png',
      'scramble': 'x\' R U\' R D R\' U R D\' R\' U R D R\' U\' R D\' x'
    },
    {
      'image': 'assets/8.png',
      'scramble': 'R U R\' U\' R\' F R2 U\' R\' U\' R U R\' F\''
    },
    {
      'image': 'assets/9.png',
      'scramble': 'R\' U2 R U2 R\' F R U R\' U\' R\' F\' R2 U\''
    },
    {
      'image': 'assets/10.png',
      'scramble': 'R U R\' F\' R U R\' U\' R\' F R2 U\' R\''
    },
    {
      'image': 'assets/11.png',
      'scramble': 'R\' U\' R\' F R U R\' U\' R\' F\' R2 U'
    },
    {
      'image': 'assets/13.png',
      'scramble': 'R\' U\' R\' D\' R U\' R\' D R2 U\' R\' '
    },
    {
      'image': 'assets/14.png',
      'scramble': 'F R\' U\' R\' U\' R U R\' U R U\' R\' F\''
    },
    {
      'image': 'assets/15.png',
      'scramble': 'R2 U\' R\' U\' R\' U R U R U\' R\' U R2'
    },
    {'image': 'assets/16.png', 'scramble': 'R2 U R\' U R\' U\' R U\' R\' U R2'},
    {
      'image': 'assets/17.png',
      'scramble': 'R\' U R U R\' U2 R U R\' U\' R\' U2 R\' U2'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var count = 1;

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0, // Espaciado entre columnas
      mainAxisSpacing: 8.0, // Espaciado entre filas
      childAspectRatio: 3 / 4,
      children: ollCases.map((ollCase) {
        return CardAlgorithms(
          title: 'OLL ${count++}',
          image: ollCase['image']!, // Acceso correcto al valor de la imagen
          scramble:
              ollCase['scramble']!, // Acceso correcto al valor del scramble
        );
      }).toList(),
    );
  }
}
