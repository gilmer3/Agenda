import 'package:flutter/material.dart';
import 'package:agenda/services/firebase_services.dart';

class vertarea extends StatefulWidget {
  const vertarea({super.key});

  @override
  State<vertarea> createState() => _vertareaState();
}

class _vertareaState extends State<vertarea> {

  TextEditingController name = TextEditingController(text: "");
  TextEditingController descricion = TextEditingController(text: "");
  TextEditingController dueno = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic>? args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>?;
    name.text = args?['nombre'];
    descricion.text = args?['descripcion'];
    return Scaffold(
      appBar: AppBar(title: const Text('Ver tarea')),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Ver tarea'),
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
            Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
            MaterialButton(
              onPressed: () async{
                await Actulizar(args?['uid'], name.text, descricion.text).then((value){
                  Navigator.pushNamed(context, "/inicio");
                });
              },
              child: const Text('Actualizar tarea'),
              color: Colors.blue,
              textColor: Colors.white,
              
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
            MaterialButton(
              onPressed: () async{
                await Eliminar(args?['uid'], context);
              },
              child: const Text('Eliminar tarea'),
              color: Colors.red,
              textColor: Colors.white,
              
            ),
          ],
        ),
      )
    );
  }
}