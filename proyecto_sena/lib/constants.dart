import 'package:flutter/material.dart';
import 'package:proyecto_sena/pages/home_page.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'meal_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ZoomDrawer(
        angle: 0.0,
        mainScreen: HomePage(),
        menuScreen: MealPage(),
      ),
    );
  }
}
