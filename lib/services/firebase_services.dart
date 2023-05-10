import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//registro
Future<void> guardarCuenta(String email, String password, String name, String password2, context) async{
  if(password == password2){
    if(email == "" || password == "" || name == ""){
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('No puede haber campos vacios'),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }else{
      try{
        await db.collection('cuentas').doc(email).set({
          'email': email,
          'password': password,
          'name': name,
        });
        }catch(e){
      
      }
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Registro exito'),
            content: const Text('Se ha registrado correctamente'),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/login");
                },
                child: const Text('Aceptar'),
              )
            ],
          );
        }
      );
      
    }
  }else{
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Las contraseñas no coinciden'),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

//inicio de sesion
Future<void> validar(String correo, String contrasena, context) async {
  await db.collection("cuentas").where("email", isEqualTo: correo).where("password", isEqualTo: contrasena).get().then((value) {
    if (value.docs.length > 0) {
      Navigator.pushNamed(context, "/inicio", arguments:{"email": correo});
    } else {
      showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error de autentificacion'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('correo o contraseña incorectos'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
    }
  });
}


//imprimir las tareas
Future<List> getTareas() async{
  List tareas = [];
  QuerySnapshot querySnapshot = await db.collection("tareas").get();
  for (var doc in querySnapshot.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final tarea = {
      "uid": doc.id,
      "nombre": data["nombre"],
      "descripcion": data["descripcion"],
    };
    tareas.add(tarea);
  }

  return tareas;
}

//crear nueva tarea
Future<void> crearTarea(String nombre, String descripcion, context) async{
  if(nombre == "" || descripcion == ""){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('No puede haber campos vacios'),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }else{
    try{
      await db.collection('tareas').doc(nombre).set({
        'nombre': nombre,
        'descripcion': descripcion,
      });
      }catch(e){
    
    }
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Tarea creada'),
          content: const Text('Se ha creado la tarea correctamente'),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, "/inicio");
              },
              child: const Text('Aceptar'),
            )
          ],
        );
      }
    );
    
  }
}

//actualizar tarea
Future<void> Actulizar(String uid, String name, String descricion) async{
  await db.collection('tareas').doc(uid).update({
    'nombre': name,
    'descripcion': descricion,
  });
}


//eliminar tarea 
Future<void> Eliminar(String uid, context) async{
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Eliminar tarea'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('¿Esta seguro de eliminar la tarea?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              db.collection('tareas').doc(uid).delete();
              Navigator.pushNamed(context, "/inicio");
            },
          ),
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}