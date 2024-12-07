import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_rubik/widgets/custom_app_bar.dart';
import 'package:timer_rubik/providers/scramble_providers.dart';
import 'package:timer_rubik/providers/times_providers.dart';
import 'package:timer_rubik/screens/onboarding_screen.dart';
import 'package:timer_rubik/views/side_menu.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimesProvider()),
        ChangeNotifierProvider(create: (_) => ScrambleProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: SideMenu(),
            appBar: CustomAppBar(),
            body: OnBoardingScreen()),
      ),
    );
  }
}
