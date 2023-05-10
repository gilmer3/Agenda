import 'package:agenda/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:agenda/services/firebase_services.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  TextEditingController name = TextEditingController(text: "");
  TextEditingController password2 = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrarse')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('Registrarse'),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              TextField(
                  controller: email,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo',
                  icon: Icon(Icons.email),
                  ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              TextField(
                  controller: name,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                  icon: Icon(Icons.person),
                  
                ),
              ),  
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              TextField(
                  controller: password,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  icon: Icon(Icons.lock),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              TextField(
                  controller: password2,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirmar contraseña',
                  icon: Icon(Icons.lock_outline_rounded),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              MaterialButton(
                onPressed: (){
                  guardarCuenta(email.text, password.text, name.text, password2.text, context);
                },
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: const Text('Registrarse'),
                color: Colors.blue,
              )
              
            ],
          ),
        ),
      )
    );
  }
}