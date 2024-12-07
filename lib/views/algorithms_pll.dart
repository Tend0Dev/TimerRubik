import 'package:flutter/material.dart';
import 'package:timer_rubik/widgets/card_algorithms.dart';

class AlgorithmsPll extends StatelessWidget {
  AlgorithmsPll({super.key});

  final List<Map<String, String>> pllCases = [
    {
      'name': 'Ua Perm',
      'algorithm': 'R2 U R U R\' U\' R\' U\' R\' U R\'',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9XKScaIoO7ApgCf_PHD0iB4wEaiiWpGh4BzdNVOxYoAHq_k4dmIKr5uwRPe8EAxL9nhg&usqp=CAU'
    },
    {
      'name': 'Ub Perm',
      'algorithm': 'R U\' R U R U R U\' R\' U\' R2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPrJ6GrNrCfDuQsuxJ0g8WEzDNgpHNkbILyaYnetowewGXV5lWmMWK76Hrd2itciiYoTg&usqp=CAU'
    },
    {
      'name': 'Z Perm',
      'algorithm': 'M2 U M2 U M\' U2 M2 U2 M\'',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkFrea8BVqr4eqGYrE5N59SEHkVxA6NzRcLXUwLDRC5ZsJxJ2Ug9sBblznPc-XeUM5C84&usqp=CAU'
    },
    {
      'name': 'H Perm',
      'algorithm': 'M2 U M2 U2 M2 U M2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrPYZOUhz5dmiey6f9_gTNFDP-dvvfbx9XErqiU5C54SQN4mfQ3sMU1wSolxGaVF5OoOE&usqp=CAU'
    },
    {
      'name': 'Aa Perm',
      'algorithm': 'x R\' U R\' D2 R U\' R\' D2 R2 x\'',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYQPee-89q9Dgzeq5xOuAXf_zC8qCOx-eYoyZ3vWExxxl68APIl_9wf7OB-Fclv2WE3bY&usqp=CAU'
    },
    {
      'name': 'Ab Perm',
      'algorithm': 'x R2 D2 R U R\' D2 R U\' R x\'',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkFrea8BVqr4eqGYrE5N59SEHkVxA6NzRcLXUwLDRC5ZsJxJ2Ug9sBblznPc-XeUM5C84&usqp=CAU'
    },
    {
      'name': 'E Perm',
      'algorithm': 'x\' R U\' R D R\' U R D\' R\' U R D R\' U\' R D\' x',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj91TbqUulQwXZ1uZZ_hvahnbZFqQJ-f062l-liSN060nPZF1jrIbc-b4FqbVw7JCICsg&usqp=CAU'
    },
    {
      'name': 'T Perm',
      'algorithm': 'R U R\' U\' R\' F R2 U\' R\' U\' R U R\' F\'',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcFqnd7zjfTatW-iLPSJjqbdjSQJAMDP9jgdcTneyKwvCOcwvPJZBgwVq3EN2cdN3oWl8&usqp=CAU'
    },
    {
      'name': 'F Perm',
      'algorithm': 'R\' U2 R U2 R\' F R U R\' U\' R\' F\' R2 U\'',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9XKScaIoO7ApgCf_PHD0iB4wEaiiWpGh4BzdNVOxYoAHq_k4dmIKr5uwRPe8EAxL9nhg&usqp=CAU'
    },
    {
      'name': 'Jb Perm',
      'algorithm': 'R U R\' F\' R U R\' U\' R\' F R2 U\' R\'',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPrJ6GrNrCfDuQsuxJ0g8WEzDNgpHNkbILyaYnetowewGXV5lWmMWK76Hrd2itciiYoTg&usqp=CAU'
    },
    {
      'name': 'Ja Perm',
      'algorithm': 'R\' U\' R\' F R U R\' U\' R\' F\' R2 U',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt6JW_pFwMKG_zGiYX5y3UXwu13HGIdJQH9w&s'
    },
    {
      'name': 'L Perm',
      'algorithm': 'M2 U M2 U M2 U2 M2 U M2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrPYZOUhz5dmiey6f9_gTNFDP-dvvfbx9XErqiU5C54SQN4mfQ3sMU1wSolxGaVF5OoOE&usqp=CAU'
    },
    {
      'name': 'V Perm',
      'algorithm': 'R\' U\' R\' D\' R U\' R\' D R2 U\' R\' ',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYQPee-89q9Dgzeq5xOuAXf_zC8qCOx-eYoyZ3vWExxxl68APIl_9wf7OB-Fclv2WE3bY&usqp=CAU'
    },
    {
      'name': 'Y Perm',
      'algorithm': 'F R\' U\' R\' U\' R U R\' U R U\' R\' F\'',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFiJETJy37OuWtxMp5gPUE7YNB3UqCc-Hwrr_vYD-ZPqLr5CAziv0BSAIp83IO5XnmP28&usqp=CAU'
    },
    {
      'name': 'N Perm (N1)',
      'algorithm': 'R2 U\' R\' U\' R\' U R U R U\' R\' U R2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj91TbqUulQwXZ1uZZ_hvahnbZFqQJ-f062l-liSN060nPZF1jrIbc-b4FqbVw7JCICsg&usqp=CAU'
    },
    {
      'name': 'N Perm (N2)',
      'algorithm': 'R2 U R\' U R\' U\' R U\' R\' U R2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcFqnd7zjfTatW-iLPSJjqbdjSQJAMDP9jgdcTneyKwvCOcwvPJZBgwVq3EN2cdN3oWl8&usqp=CAU'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0, // Espaciado entre columnas
      mainAxisSpacing: 8.0, // Espaciado entre filas
      childAspectRatio: 3 / 4,
      children: pllCases.map((pllCase) {
        return CardAlgorithms(
          title: pllCase['name']!,
          image: pllCase['image']!,
          scramble: pllCase['algorithm']!,
        );
      }).toList(),
    );
  }
}
