import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'menu.dart';

class PdfPage extends StatefulWidget {

  const PdfPage({Key? key}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
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

  PrintingInfo? printingInfo;
  @override
  void initState(){
    super.initState();
    _init();
  }
  Future<void>_init() async{
    final info = await Printing.info();
    setState(() {
      printingInfo=info;
    });
  }
  @override
  Widget build(BuildContext context) {
    pw.RichText.debug=true;
    final actions=<PdfPreviewAction>[
      if(!kIsWeb)
        const PdfPreviewAction(
            icon: Icon(Icons.save, color: Colors.green,),
            onPressed: saveAsFile,
        ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factura de la compra'),
        backgroundColor: Colors.green,
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        actions: actions,
        onPrinted: showPrintedToast,
        onShared: showSharedToast,
        build: generatePdf,
      ),
    );
  }
}
