import 'package:flutter/material.dart';
import 'package:agenda/auth/login.dart';
import 'package:agenda/auth/register.dart';
import 'package:agenda/pages/index.dart';
import 'package:agenda/pages/crear_tarea.dart';
import 'package:agenda/services/firebase_services.dart';
import 'package:agenda/pages/vertarea.dart';
//firebase 
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      initialRoute: "/",
      routes: {
        //"/":(context) => const MyHomePage(),
        "/login": (context) => const login(),
        "/register": (context) => const register(),
        "/inicio":(context) => const inicio(),
        "/nuevatarea":(context) => const nuevatarea(),
        "/vertarea":(context) => const vertarea(), 
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Empieza a crear tu agenda'),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            MaterialButton(
              onPressed: (){
                Navigator.pushNamed(context, "/login");
              },
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text('Iniciar Sesión'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            MaterialButton(
              onPressed: (){
                Navigator.pushNamed(context, "/register");
              
              },
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: const Text('Registrarse'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
         
          ],
        )
      )
    );
  }
}