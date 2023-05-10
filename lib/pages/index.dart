import 'package:flutter/material.dart';
import 'package:agenda/services/firebase_services.dart';

class inicio extends StatefulWidget {
  const inicio({super.key});

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  TextEditingController corroe = TextEditingController(text: "");
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: FutureBuilder(
        future: getTareas(),
        builder: ((context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(snapshot.data?[index]['nombre']),
                onTap: ((){
                  Navigator.pushNamed(context, "/vertarea", arguments:{
                    "uid": snapshot.data?[index]['uid'],
                    "nombre": snapshot.data?[index]['nombre'],
                    "descripcion": snapshot.data?[index]['descripcion'],
                  } );
                }),
              );
            },
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      }),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){Navigator.pushNamed(context, "/nuevatarea");},
      child: const Icon(Icons.add),
      hoverColor: Colors.blue,
    ),
    );
  }
}