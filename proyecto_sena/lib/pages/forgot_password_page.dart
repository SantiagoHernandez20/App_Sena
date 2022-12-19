import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailController = TextEditingController();

  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    var cuentaEmail = _emailController.text.trim();

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: cuentaEmail);
      showDialog<void>(
        context: context, 
        barrierDismissible: true,
        builder: (BuildContext dialogContext){
          return AlertDialog(
            title: const Text('Recuperación de Contraseña'),
            content: Text('Un email fue envíado a la cuenta $cuentaEmail'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cerrar'),
                onPressed: (){
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        });
    }
    on FirebaseAuthException catch(e){
      print(e);
      showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext){
          return AlertDialog(
            title: const Text('Firebase Error'),
            content: Text('email error: $e'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cerrar'),
                onPressed: (){
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Ingrese su email para el restablecimiento de contraseña',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: passwordReset,
            color: Colors.green,
            child: const Text(
              'Restablecer Contraseña',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
