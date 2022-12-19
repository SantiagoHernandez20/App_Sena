import 'package:flutter/material.dart';
import 'package:proyecto_sena/models/Carta.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_sena/carrito/carrito.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/cupertino.dart';

class BuscadorDelegate extends SearchDelegate {
  final List<Carta> cartas;

  List<Carta> filtro = [];

  BuscadorDelegate(this.cartas);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => this.query = '',
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => this.close(context, null),
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
          itemCount: filtro.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 0.8),
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
                  width: 215,
                  height: 215,
                  child: Image(
                    image: AssetImage('images/' + filtro[index].imagen),
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  filtro[index].nombre,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "COP." + filtro[index].precio.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
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
                            filtro,
                            index,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Ver Más >>'),
                    ),
                  ),
                ),
              ]),
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filtro = cartas
        .where((Carta) =>
            Carta.nombre.toLowerCase().contains(query.trim().toLowerCase()))
        .toList();

    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
          itemCount: filtro.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 0.8),
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
                  width: 215,
                  height: 215,
                  child: Image(
                    image: AssetImage('images/' + filtro[index].imagen),
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  filtro[index].nombre,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "COP." + filtro[index].precio.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
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
                            filtro,
                            index,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Ver Más >>'),
                    ),
                  ),
                ),
              ]),
            );
          }),
    );
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
                height: 610,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 180,
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
}
