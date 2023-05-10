import 'package:agenda/services/firebase_services.dart';
import 'package:flutter/material.dart';

class nuevatarea extends StatefulWidget {
  const nuevatarea({super.key});

  @override
  State<nuevatarea> createState() => _nuevatareaState();
}

class _nuevatareaState extends State<nuevatarea> {
  TextEditingController name = TextEditingController(text: "");
  TextEditingController descricion = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic>? args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>?;
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva tarea')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Crear nueva tarea"),
            TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre de la tarea',
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            TextField(
              controller: descricion,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descripcion de la tarea',
              ),
            ),
            MaterialButton(
              onPressed: (){
                crearTarea(name.text, descricion.text,context);
              },
              child: const Text('Crear tarea'),
              color: Colors.blue,
              textColor: Colors.white,
              
            )

          ]
        ),
      ),
    );
  }
}