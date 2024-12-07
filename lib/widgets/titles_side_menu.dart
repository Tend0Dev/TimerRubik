import 'package:flutter/material.dart';

class TitlesSideMenu extends StatelessWidget {
  final String title;
  const TitlesSideMenu({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 35, bottom: 16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Divider(
              color: Colors.grey[350],
            ),
          )
        ],
      ),
    );
  }
}
