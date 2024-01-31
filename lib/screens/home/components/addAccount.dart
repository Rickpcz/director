import 'package:flutter/material.dart';
import 'package:director/screens/forms/alumno.dart';
import 'package:director/screens/forms/padre.dart';
import 'package:director/screens/forms/profesor.dart';
import 'package:director/screens/forms/psicologo.dart';

class RecomendsAddAccount extends StatelessWidget {
  const RecomendsAddAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RecomendAccountCard(
                image: "assets/boy.png",
                title: "Niño",
                icon: Icons.add,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormAlumno(),
                    ),
                  );
                },
              ),
              RecomendAccountCard(
                image: "assets/doctor.png",
                title: "Psicólogo",
                icon: Icons.add,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormPsicologo(),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              RecomendAccountCard(
                image: "assets/teachers.png",
                title: "Profesor",
                icon: Icons.add,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormProfe(),
                    ),
                  );
                },
              ),
              RecomendAccountCard(
                image: "assets/father-and-daughter.png",
                title: "Padre",
                icon: Icons.add,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormPadre(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecomendAccountCard extends StatelessWidget {
  const RecomendAccountCard({
    Key? key,
    required this.image,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 20,
        right: 20,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: size.height * 0.2,
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: title.toUpperCase(),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    icon,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
