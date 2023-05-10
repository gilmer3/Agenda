import 'package:agenda/services/firebase_services.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesion')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('Iniciar sesion'),
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
                controller: password,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
                icon: Icon(Icons.lock),
                  //suffixIcon: IconButton(onPressed:(){}, icon: Icon(Icons.visibility)),
                  
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              MaterialButton(
                onPressed: (){
                  validar(email.text, password.text, context);
                },
                child: const Text('Iniciar sesion'),
                color: Colors.blue,
                textColor: Colors.white,
              
              )
              
            ],
          ),
        ),
      ),
    );
  }
}