import 'package:flutter/material.dart';

class IconsSideMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget destination; // Página a la que se navegará

  const IconsSideMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ListTile(
            leading: SizedBox(
              height: 34,
              width: 34,
              child: Icon(
                icon,
                color: Colors.black,
                size: 25,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              // Navega a la página de destino
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
              );
            },
          ),
        ],
      ),
    );
  }
}
