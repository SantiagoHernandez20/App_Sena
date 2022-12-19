import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_sena/carrito/carrito.dart';
import 'package:proyecto_sena/models/Carta.dart';
import '../auth/main_page.dart';
import 'shopping_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'buscador_productos.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _globalKey,
          appBar: AppBar(
            leading: MenuDrawer(),
            title: Text("Tienda CBA Mosquera", style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.green,
            elevation: 0,
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: BuscadorDelegate(todos),
                        );
                      }),
                ],
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                          blurRadius: 7,
                        )
                      ]
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: const[
                      //Encabezado ventana 1
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text("Lacteos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      //Encabezado ventana 2
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text("Carnicos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      //Encabezado ventana 3
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text("Frutas y Verduras", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Body ventana 1
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: GridView.builder(
                            itemCount: lacteos.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: MediaQuery.of(context)
                                    .size
                                    .width /
                                    (MediaQuery.of(context).size.height /
                                        0.8),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x000005cc),
                                          blurRadius: 30,
                                          offset: Offset(10, 10))
                                    ]),
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 185,
                                    height: 185,
                                    child: Image(
                                      image: AssetImage('images/' + lacteos[index].imagen),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    lacteos[index].nombre,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "COP " + lacteos[index].precio.toString(),
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            carrito.agregarItem(
                                                lacteos[index].id.toString(),
                                                lacteos[index].nombre,
                                                lacteos[index].precio,
                                                "1",
                                                lacteos[index].imagen,
                                                1);
                                          });
                                        },
                                        icon: const Icon(Icons.shopping_cart),
                                        label: const Text('Añadir al Carrito'),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(10))),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Container(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          ChangeNotifierProvider(
                                            create: (context) => Carrito(),
                                            child: await showDialogFunc(
                                              context,
                                              lacteos,
                                              index,
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text('Ver Más >>'),
                                      ),
                                    ),
                                  ),
                                ]),
                              );
                            }),
                      ),
                      // Body ventana 2
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: GridView.builder(
                            itemCount: carnicos.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: MediaQuery.of(context)
                                    .size
                                    .width /
                                    (MediaQuery.of(context).size.height /
                                        0.8),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x000005cc),
                                          blurRadius: 30,
                                          offset: Offset(10, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 180,
                                      height: 180,
                                      child: Image(
                                        image: AssetImage('images/' + carnicos[index].imagen),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      carnicos[index].nombre,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 13),
                                      child: Text(
                                        "COP " +
                                            carnicos[index].precio.toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 13),
                                      child: ElevatedButton.icon(
                                          onPressed: () {
                                            if (carnicos[index].nombre ==
                                                "Cubeta de Huevos" &&
                                                carrito.numeroItems == 0) {
                                              _showAlert2(context);
                                            } else {
                                              setState(() {
                                                carrito.agregarItem(
                                                    carnicos[index]
                                                        .id
                                                        .toString(),
                                                    carnicos[index].nombre,
                                                    carnicos[index].precio,
                                                    "1",
                                                    carnicos[index].imagen,
                                                    1);
                                              });
                                            }
                                          },
                                          icon: const Icon(Icons.shopping_cart),
                                          label:
                                          const Text('Añadir al Carrito'),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10)))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Container(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            ChangeNotifierProvider(
                                              create: (context) => Carrito(),
                                              child: await showDialogFunc(
                                                context,
                                                carnicos,
                                                index,
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text('Ver Más >>'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      // Body ventana 3
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: GridView.builder(
                            itemCount: frutos.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: MediaQuery.of(context)
                                    .size
                                    .width /
                                    (MediaQuery.of(context).size.height /
                                        0.8),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x000005cc),
                                          blurRadius: 30,
                                          offset: Offset(10, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 180,
                                      height: 180,
                                      child: Image(
                                        image: AssetImage('images/' + frutos[index].imagen),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      frutos[index].nombre,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        "COP " +
                                            frutos[index].precio.toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: ElevatedButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              carrito.agregarItem(
                                                  frutos[index].id.toString(),
                                                  frutos[index].nombre,
                                                  frutos[index].precio,
                                                  "1",
                                                  frutos[index].imagen,
                                                  1);
                                            });
                                          },
                                          icon: const Icon(Icons.shopping_cart),
                                          label:
                                          const Text('Añadir al Carrito'),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10)))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            ChangeNotifierProvider(
                                              create: (context) => Carrito(),
                                              child: await showDialogFunc(
                                                context,
                                                frutos,
                                                index,
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text('Ver Más >>'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              elevation: 8.0,
              onPressed: () {},
              backgroundColor: Colors.green,
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      if (FirebaseAuth.instance.currentUser != null) {
                        carrito.numeroItems != 0
                            ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext) => Carrito_compras()))
                            : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ir al carrito')));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Agrega un producto')));
                      } else {
                        _showAlert(context);
                      }
                    },
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4)),
                      constraints:
                      const BoxConstraints(minWidth: 14, minHeight: 14),
                      child: Text(
                        carrito.numeroItems.toString(),
                        textAlign: TextAlign.center,
                        style:
                        const TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  )
                ],
              )),
        ),
      );
    });
  }

  Future showDialogFunc(
      BuildContext context,
      item,
      index,
      ) {
    return showDialog(
      context: context,
      builder: (context) {
        return Consumer<Carrito>(builder: (context, carrito, child) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFEDECF2),
                ),
                padding: const EdgeInsets.all(0),
                height: 660,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          width: 215,
                          height: 215,
                          child: Image(
                            image: AssetImage('images/' + item[index].imagen),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item[index].nombre,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    Text(
                                      item[index].id.toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 4,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: 22,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.yellow),
                                      onRatingUpdate: (index) {},
                                    ),
                                    Text(
                                      'Calificacion',
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Descripcion:',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      item[index].descripcion,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Text(
                                      'Tiempo de entrega: ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.clock,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '5 min',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 6, left: 4),
                              child: Container(
                                child: Row(
                                  children: [
                                    const Text(
                                      'Precio: ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      item[index].precio.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 4),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.check),
                                label: const Text(
                                  'Aceptar',
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("¿Quiere acceder al carrito?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("¡Para acceder al carrito debe Iniciar Sesión!"),
              Container(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancelar',
                style:
                TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext) => MainPage(),
                ),
              ),
              child: Text(
                'Iniciar Sesión',
                style:
                TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAlert2(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("¿Quiere comprar huevos?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("¡Para comprar huevos debe comprar otro producto!"),
              Container(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Aceptar',
                style:
                TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(Icons.menu, color: Colors.white),
    );
  }
}
