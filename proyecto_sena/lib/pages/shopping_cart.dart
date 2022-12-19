import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../carrito/carrito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../pdf/pdf_screen.dart';

class Carrito_compras extends StatefulWidget {
  const Carrito_compras({super.key});

  @override
  State<Carrito_compras> createState() => _Carrito_comprasState();
}

class _Carrito_comprasState extends State<Carrito_compras> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final String data = '123456';

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Pedidos de ${user.email!}"),
          elevation: 0,
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              child: carrito.items.isEmpty
                  ? const Center(
                      child: Text("carrito vacio"),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        for (var item in carrito.items.values)
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  child: Image(
                                    image: AssetImage("images/${item.imagen}"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(item.nombre),
                                        Text(
                                            "COP.${item.precio}x${item.unidad}"),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              width: 50,
                                              height: 30,
                                              decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 13,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    carrito
                                                        .deincrementarCantidadItem(
                                                            item.id);
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                    item.cantidad.toString()),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 30,
                                              decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 13,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    carrito
                                                        .incrementarCantidadItem(
                                                            item.id);
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: <Widget>[
                              const Expanded(
                                child: Text("Subtotal:"),
                              ),
                              Text(
                                  "COP. ${carrito.subTotal.toStringAsFixed(2)}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: <Widget>[
                              const Expanded(
                                child: Text("Impuestos:"),
                              ),
                              Text(
                                  "COP. ${carrito.impuesto.toStringAsFixed(2)}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: <Widget>[
                              const Expanded(
                                child: Text("Total:", style: TextStyle(fontSize: 30),),
                              ),
                              Text("COP. ${carrito.total.toStringAsFixed(2)}", style: TextStyle(fontSize: 30),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Icon(Icons.picture_as_pdf),
                              ElevatedButton(
                                onPressed: () async {
                                  String pedido = "";
                                  carrito.items.forEach((key, value) {
                                    pedido =
                                        "$pedido${value.nombre}, CANTIDAD: ${value.cantidad}, Precio Unitario: ${value.precio}, Precio Total: ${(value.cantidad * value.precio).toStringAsFixed(2)}.\n";
                                  });
                                  pedido =
                                      "${pedido} Subtotal: ${carrito.subTotal.toStringAsFixed(2)}\n";
                                  "\n"
                                      "\n";
                                  pedido =
                                      "${pedido} Impuesto: ${carrito.impuesto.toStringAsFixed(2)}\n";
                                  "\n"
                                      "\n";
                                  pedido =
                                      "${pedido} Total: ${carrito.total.toStringAsFixed(2)}\n";
                                  "\n"
                                      "\n";
                                  pedido =
                                      "${pedido} Regitrado(a) en la plataforma con el correo ${user.email}.\n";
                                  "\n"
                                      "\n";
                                  pedido =
                                      "${pedido} Teléfonos de contacto en caso de no reclamar el pedido:\n";
                                  "\n"
                                      "\n";
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PdfPage()));
                                },
                                child: Text('Generar PDF'),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.green,
          overlayOpacity: 0.4,
          overlayColor: Colors.black,
          children: [
            SpeedDialChild(
              label: 'Enviar factura al vendedor',
              child: IconButton(
                onPressed: () async {
                  //creación variables Firebase
                  var nombre = "";
                  nombre = await _getnombre(user.email).then((value) {
                    return value;
                  });
                  var apellido = "";
                  apellido = await _getapellido(user.email).then((value) {
                    return value;
                  });
                  var tdoc = "";
                  tdoc = await _gettipodoc(user.email).then((value) {
                    return value;
                  });
                  var documento = "";
                  documento = await _getdocumento(user.email).then((value) {
                    return value;
                  });
                  var telefono = "";
                  telefono = await _gettelefono(user.email).then((value) {
                    return value;
                  });
                  var celular = "";
                  celular = await _getcelular(user.email).then((value) {
                    return value;
                  });
                  String pedido = "";
                  carrito.items.forEach((key, value) {
                    pedido =
                        "$pedido${value.nombre}, CANTIDAD: ${value.cantidad}, Precio Unitario: ${value.precio}, Precio Total: ${(value.cantidad * value.precio).toStringAsFixed(2)}.\n";
                  });
                  pedido =
                      "${pedido} Subtotal: ${carrito.subTotal.toStringAsFixed(2)}\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido} Impuesto: ${carrito.impuesto.toStringAsFixed(2)}\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido} Total: ${carrito.total.toStringAsFixed(2)}\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido} Factura a nombre: ${nombre} ${apellido}.\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido} Identificado(a) con ${tdoc} de número ${documento}.\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido} Regitrado(a) en la plataforma con el correo ${user.email}.\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido} Teléfonos de contacto en caso de no reclamar el pedido:\n";
                  "\n"
                      "\n";
                  pedido = "${pedido} Fijo: ${telefono}, Celular: ${celular}.";

                  // vincular whatsapp

                  String celular_1 = "573208786872";
                  String mensaje = pedido;
                  String url = "whatsapp://send?phone=$celular_1&text=$mensaje";
                  final Uri _url = Uri.parse(url);

                  await launchUrl(_url);
                  log(pedido);
                },
                icon: Icon(Icons.whatsapp_outlined),
              ),
            ),
            SpeedDialChild(
              label: 'Enviar factura a tienda',
              child: IconButton(
                onPressed: () async {
                  //creación variables Firebase
                  var nombre = "";
                  nombre = await _getnombre(user.email).then((value) {
                    return value;
                  });
                  var apellido = "";
                  apellido = await _getapellido(user.email).then((value) {
                    return value;
                  });
                  var tdoc = "";
                  tdoc = await _gettipodoc(user.email).then((value) {
                    return value;
                  });
                  var documento = "";
                  documento = await _getdocumento(user.email).then((value) {
                    return value;
                  });
                  var telefono = "";
                  telefono = await _gettelefono(user.email).then((value) {
                    return value;
                  });
                  var celular = "";
                  celular = await _getcelular(user.email).then((value) {
                    return value;
                  });
                  String pedido = "";
                  carrito.items.forEach((key, value) {
                    pedido =
                        "$pedido${value.nombre},\n CANTIDAD :${value.cantidad},\n Precio Unitario : ${value.precio},\n Precio Total :${(value.cantidad * value.precio).toStringAsFixed(2)}.\n";
                  });
                  pedido =
                      "${pedido}Subtotal:${carrito.subTotal.toStringAsFixed(2)}\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido} Impuesto: ${carrito.impuesto.toStringAsFixed(2)}\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido}Total:${carrito.total.toStringAsFixed(2)}\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido}Factura a nombre: ${nombre} ${apellido}.\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido}Identificado(a) con ${tdoc} de número ${documento}.\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido}Regitrado(a) en la plataforma con el correo ${user.email}.\n";
                  "\n"
                      "\n";
                  pedido =
                      "${pedido}Teléfonos de contacto en caso de no reclamar el pedido:\n";
                  "\n"
                      "\n";
                  pedido = "${pedido}Fijo: ${telefono}, Celular: ${celular}.";

                  // vincular whatsapp

                  String celular_2 = "573227330590";
                  String mensaje = pedido;
                  String url = "whatsapp://send?phone=$celular_2&text=$mensaje";
                  final Uri _url = Uri.parse(url);

                  await launchUrl(_url);
                  log(pedido);
                },
                icon: Icon(Icons.whatsapp),
              ),
            ),
            SpeedDialChild(
              label: 'Pagar en Línea',
              child: IconButton(
                onPressed: () async {
                  double mensaje = carrito.total;
                  String url = "https://tiencba.000webhostapp.com/?precio=${mensaje}";
                  final Uri _url = Uri.parse(url);

                  await launchUrl(_url);
                  log(carrito.total.toString());
                },
                icon: Icon(Icons.monetization_on),
              ),
            ),
          ],
        ),
      );
    });
  }
  // metodos para crear las variables Firebase

  Future<String> _getnombre(email) async {
    String nombre = "";
    try {
      await FirebaseFirestore.instance
          .collection('cuentas')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          if (data['email'] == email) {
            nombre = data['first name'].toString();
          }
        });
        return nombre;
      });
    } catch (e) {
      print(e);
    }
    return nombre;
  }

  Future<String> _getapellido(email) async {
    String apellido = "";
    try {
      await FirebaseFirestore.instance
          .collection('cuentas')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          if (data['email'] == email) {
            apellido = data['last name'].toString();
          }
        });
        return apellido;
      });
    } catch (e) {
      print(e);
    }
    return apellido;
  }

  Future<String> _gettipodoc(email) async {
    String tdoc = "";
    try {
      await FirebaseFirestore.instance
          .collection('cuentas')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          if (data['email'] == email) {
            tdoc = data['type document'].toString();
          }
        });
        return tdoc;
      });
    } catch (e) {
      print(e);
    }
    return tdoc;
  }

  Future<String> _getdocumento(email) async {
    String documento = "";
    try {
      await FirebaseFirestore.instance
          .collection('cuentas')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          if (data['email'] == email) {
            documento = data['document'].toString();
          }
        });
        return documento;
      });
    } catch (e) {
      print(e);
    }
    return documento;
  }

  Future<String> _gettelefono(email) async {
    String telefono = "";
    try {
      await FirebaseFirestore.instance
          .collection('cuentas')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          if (data['email'] == email) {
            telefono = data['phone'].toString();
          }
        });
        return telefono;
      });
    } catch (e) {
      print(e);
    }
    return telefono;
  }

  Future<String> _getcelular(email) async {
    String tcelular = "";
    try {
      await FirebaseFirestore.instance
          .collection('cuentas')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          if (data['email'] == email) {
            tcelular = data['cell phone'].toString();
          }
        });
        return tcelular;
      });
    } catch (e) {
      print(e);
    }
    return tcelular;
  }
}
