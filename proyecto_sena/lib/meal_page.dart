import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_sena/auth/main_page.dart';

class MenuOption {
  final IconData icon;
  final String title;

  const MenuOption(this.icon, this.title);
}

class MealPage extends StatefulWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  State<MealPage> createState() => _MealPageState();
}

final user = FirebaseAuth.instance.currentUser!;
var drawerTextColor = const TextStyle(color: Colors.white, fontSize: 15);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);


class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                ZoomDrawer.of(context)!.close();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                 CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/sena.png')
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: const [
                    Text(
                      "Tienda\nCBA",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              return _Inicio();
            },
          ),
          SizedBox(height: 20),
          Builder(builder: (BuildContext context) {
            return _Sesion(context);
          }),
        ],
      ),
    );
  }

  Widget _Inicio() {
    if (FirebaseAuth.instance.currentUser == null) {
      return const Padding(
          padding: EdgeInsets.only(left: 20),
        child:  Text(
          '¡Bienvenidos!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
    } else {
      final user = FirebaseAuth.instance.currentUser!;
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          'Usuario \n ${user.email!}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  Widget _Sesion(context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return ListTile(
        leading: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        title: Text(
          'Cerrar Sesion',
          style: drawerTextColor,
        ),
        onTap: () {
          FirebaseAuth.instance.signOut();
        },
      );
    } else {
      return ListTile(
        leading: const Icon(Icons.login, color: Colors.white),
        title: Text(
          'Iniciar Sesion',
          style: drawerTextColor,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext) => MainPage(),
            ),
          );
        },
      );
    }
  }
}