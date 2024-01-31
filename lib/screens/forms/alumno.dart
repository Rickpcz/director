import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const FormAlumno());
}

class FormAlumno extends StatelessWidget {
  const FormAlumno({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Niño', style: GoogleFonts.openSans()),
        ),
        body: const MyForm(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _diagnosticoController = TextEditingController();
  final TextEditingController _fechaNacimientoController = TextEditingController();
  final TextEditingController _gradoController = TextEditingController();
  final TextEditingController _grupoController = TextEditingController();
  final TextEditingController _gravedadController = TextEditingController();
  final TextEditingController _institucionController = TextEditingController();
  DateTime? _selectedDate;

  void _submitForm() {
    // Muestra el modal después de enviar el formulario
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Éxito'),
          content: const Text('Se ha agregado el alumno con éxito.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el modal
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _resetForm() {
    // Lógica para reiniciar el formulario
    _nombreController.clear();
    _correoController.clear();
    _contrasenaController.clear();
    _gradoController.clear();
    _grupoController.clear();
    _diagnosticoController.clear();
    _gravedadController.clear();
    _fechaNacimientoController.clear();
    setState(() {
      _selectedDate = null;
    });
    _institucionController.clear();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _fechaNacimientoController.text =
            DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _institucionController,
                decoration: const InputDecoration(
                  labelText: 'Institución',
                  prefixIcon: Icon(Icons.business_rounded),
                  border: OutlineInputBorder(),
                ),
                
              ),
               const SizedBox(height: 16),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contrasenaController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fechaNacimientoController,
                decoration: const InputDecoration(
                  labelText: 'Fecha de Nacimiento (DD/MM/YYYY)',
                  prefixIcon: Icon(Icons.calendar_month_rounded),
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _diagnosticoController,
                decoration: const InputDecoration(
                  labelText: 'Diagnóstico',
                  prefixIcon: Icon(Icons.accessible),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _gravedadController,
                decoration: const InputDecoration(
                  labelText: 'Gravedad',
                  prefixIcon: Icon(Icons.error_outline_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _gradoController,
                decoration: const InputDecoration(
                  labelText: 'Grado',
                  prefixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _grupoController,
                decoration: const InputDecoration(
                  labelText: 'Grupo',
                  prefixIcon: Icon(Icons.group),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                      _resetForm();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 50),
                      backgroundColor: const Color(0xFF60A9CD),
                      textStyle: TextStyle(
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        color: Colors.white,
                      ),
                      side: BorderSide.none,
                    ),
                    child: Text('Agregar',style: TextStyle(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      color: Colors.white,
                    ),),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _resetForm();
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(120, 50),
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontFamily: GoogleFonts.openSans().fontFamily,
                      ),
                      side: BorderSide.none,
                    ),
                    child:  Text(
                      'Cancelar',
                      style: TextStyle(
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
