import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        elevation: 0, // Ajusta la elevación a 0 para eliminar la sombra
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Perfil',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ,
                  ),
              ),
              const SizedBox(height: 20,),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/profile_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      child: const Icon(Icons.camera_alt, size: 30,),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              // Contenedor tipo input para los datos
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: const [
                      ListTile(
                        title: Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Juan Pérez'),
                      ),
                      ListTile(
                        title: Text('Institución', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Universidad del Mayab'),
                      ),
                      // Correo electrónico
                      ListTile(
                        title: Text('Correo electrónico', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('juan.perez@example.com'),
                      ),
                      // Teléfono
                      ListTile(
                        title: Text('Fecha de nacimiento', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('30/01/1999'),
                      ),
                      
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, size: 24, color: Color.fromARGB(255, 255, 255, 255)),
                label: Text(
                  'Log Out',
                  style: GoogleFonts.openSans().copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Color de fondo del botón
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}