import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String myName = "Amín Jesús Báez Espinosa";
  final String myPhotoUrl = "assets/profile_photo.jpg";
  final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm:ss a');

  MyHomePage({super.key});

  String getCurrentDateTime() {
    return formatter.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Aplicación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(myPhotoUrl),
            ),
            const SizedBox(height: 20),
            Text(
              'Nombre: $myName',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              'Fecha y Hora Actual:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Text(
                  getCurrentDateTime(),
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
