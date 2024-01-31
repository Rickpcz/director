import 'package:director/screens/Accounts/acccountProfesor.dart';
import 'package:director/screens/Accounts/accountAlumno.dart';
import 'package:director/screens/Accounts/accountPadre.dart';
import 'package:director/screens/Accounts/accountPsicologo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AddPage());
}

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<ItemModel> items = [
    ItemModel("Niños", "assets/boy.png",  const AccountAlumno()),
    ItemModel("Maestros", "assets/teachers.png", const AccountProfesor()),
    ItemModel("Psicólogos", "assets/doctor.png", const AccountPsicologo()),
    ItemModel("Padres", "assets/father-and-daughter.png", const AccountPadre()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuentas'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navega a la pantalla asociada con el índice actual
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => items[index].destination,
                ),
              );
            },
            child: Container(
              height: 120.0,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  // Ajusta el tamaño de la imagen según tus preferencias
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset(
                      items[index].imagePath,
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Center(
                      child: Text(
                        items[index].text,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class ItemModel {
  final String text;
  final String imagePath;
  final Widget destination;

  ItemModel(this.text, this.imagePath, this.destination);
}
