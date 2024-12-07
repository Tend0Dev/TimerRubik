import 'package:flutter/material.dart';
import 'package:timer_rubik/screens/algorithms_screen.dart';
import 'package:timer_rubik/widgets/icons_side_menu.dart';
import 'package:timer_rubik/widgets/titles_side_menu.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFFFFFFFF),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.asset('assets/banner.jpeg'),
              ),
              const TitlesSideMenu(title: 'ALGORITMOS'),
              const IconsSideMenu(
                icon: Icons.api_rounded,
                title: 'PLL',
                destination: AlgorithmsScreen(
                  algorithmType: 'PLL',
                ),
              ),
              const IconsSideMenu(
                icon: Icons.apps,
                title: 'OLL',
                destination: AlgorithmsScreen(
                  algorithmType: 'OLL',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
