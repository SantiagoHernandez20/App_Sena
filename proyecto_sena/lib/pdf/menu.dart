import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../carrito/carrito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proyecto_sena/pdf/url_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/shopping_cart.dart';
import 'pdf_screen.dart';

Future<Uint8List>generatePdf(final PdfPageFormat format) async {
  final doc = pw.Document(
    title: 'Flutter School',
  );
  final logoImage=pw.MemoryImage((await rootBundle.load('images/senaa.png')).buffer.asUint8List());

  final user = FirebaseAuth.instance.currentUser!;
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
  doc.addPage(
    pw.MultiPage(
      header: (final context)=>pw.Image(
        alignment: pw.Alignment.topLeft,
        logoImage,
        fit: pw.BoxFit.contain,
        width: 70,
      ),
      build:(final context)=>[
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 30, bottom: 20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Padding(padding: const pw.EdgeInsets.only(top: 60)),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Pedidos de ${user.email!}', style: pw.TextStyle(fontSize: 13)),
                      pw.Text('Nombre: ${nombre}', style: pw.TextStyle(fontSize: 13)),
                      pw.Text('Apellido: ${apellido}', style: pw.TextStyle(fontSize: 13)),
                      pw.Text('Telefono: ${telefono}', style: pw.TextStyle(fontSize: 13)),
                      pw.Text('Documento: ${tdoc} ${documento}', style: pw.TextStyle(fontSize: 13)),
                      pw.Text('Celular: ${celular}', style: pw.TextStyle(fontSize: 13))
                    ],
                  ),
                  pw.SizedBox(width: 70),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Informacion Sena', style: pw.TextStyle(fontSize: 13)),
                      UrlText('CBA Sena', 'telefono: 888-888-444', style: TextStyle(fontSize: 13)),
                      UrlText('senamosquera@gmail.com', 'Sena', style: TextStyle(fontSize: 13))
                    ],
                  ),
                  pw.SizedBox(width: 40),
                  pw.Padding(padding: pw.EdgeInsets.zero),
                ],
              ),
            ],
          ),
        ),
        pw.Center(
          child: pw.Text(
            'Codigo de pago',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              fontSize: 30,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 40, left: 140),
          child: pw.BarcodeWidget(
            data: 'sena',
            width: 210,
            height: 210,
            barcode: pw.Barcode.qrCode(),
            drawText: false,
          ),
        ),
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 50, left: 50),
              child: pw.Text(
                  '¡Gracias por la compra!',
                  style: pw.TextStyle(
                      fontSize: 35,
                      fontWeight: pw.FontWeight.bold
                  ),
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 30, left: 50),
              child: pw.Text(
                '¡Tienda CBA!',
                style: pw.TextStyle(
                    fontSize: 25,
                    fontWeight: pw.FontWeight.bold
                ),
              ),
            ),
          ]
        ),
      ],
    ),
  );
  return doc.save();
}


Future<void> saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pageFormat,
)async{
  final bytes = await build(pageFormat);

  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath= appDocDir.path;
  final  file = File("$appDocPath/document.pdf");
  print('save as file ${file.path}...');
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showPrintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
      Text(
          'Document printed successfully'),
      ),
  );
}
void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content:
    Text(
        'Document shared successfully'),
    ),
  );
}
Future<String> _getnombre(email) async {
  String nombre = "";
  try {
    await FirebaseFirestore.instance
        .collection('cuentas')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {

        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        if(data['email'] == email){
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

        if(data['email'] == email){
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

        if(data['email'] == email){
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

        if(data['email'] == email){
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

        if(data['email'] == email){
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

        if(data['email'] == email){
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