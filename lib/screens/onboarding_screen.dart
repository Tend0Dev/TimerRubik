import 'package:flutter/material.dart';
import 'package:timer_rubik/views/rubik_timer.dart';
import 'package:timer_rubik/screens/list_views.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index; // Actualiza el índice al cambiar de página
          });
        },
        children: const [RubikTimer(), ListViews()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index; // Actualiza el índice al tocar el botón
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut, // Animación suave al cambiar de página
          );
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.timer),
            activeIcon: const Icon(Icons.timer_sharp),
            label: 'Temporizador',
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            activeIcon: const Icon(Icons.list_alt),
            label: 'Tiempos',
            backgroundColor: colors.tertiary,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Libera recursos del PageController
    super.dispose();
  }
}
