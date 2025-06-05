import 'package:flutter/material.dart';

void main() {
  runApp(const Perfil());
}

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Frame2(),
        ]),
      ),
    );
  }
}

class Frame2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 99,
                child: Container(
                  width: 437,
                  height: 775,
                  decoration: BoxDecoration(color: const Color(0xFFF1EFEF)),
                ),
              ),
              Positioned(
                left: 0,
                top: 874,
                child: Container(
                  width: 430,
                  height: 58,
                  decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: 162,
                top: 830,
                child: Container(
                  width: 91,
                  height: 87,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF4E6FFC),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 184,
                top: 850,
                child: Container(
                  width: 48,
                  height: 48,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 58,
                top: 881,
                child: Container(
                  width: 36,
                  height: 36,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 166,
                top: 135,
                child: Container(
                  width: 97,
                  height: 97,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 172,
                top: 57,
                child: SizedBox(
                  width: 360,
                  child: Text(
                    'Perfil',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 11,
                top: 340,
                child: Container(width: 38, height: 38, child: Stack()),
              ),
              Positioned(
                left: 140,
                top: 238,
                child: SizedBox(
                  width: 360,
                  child: Text(
                    'Nome do Aluno',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 166,
                top: 262,
                child: SizedBox(
                  width: 107,
                  height: 19,
                  child: Text(
                    'Matrícula: 00000',
                    style: TextStyle(
                      color: const Color(0xFF4C4C4C),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 316,
                top: 878,
                child: Container(
                  width: 39,
                  height: 39,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 181,
                top: 164,
                child: Container(
                  width: 68,
                  height: 68,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 10,
                top: 323,
                child: Container(
                  width: 396,
                  height: 67,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFFAFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 408,
                child: Container(
                  width: 396,
                  height: 67,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFFAFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 493,
                child: Container(
                  width: 396,
                  height: 67,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFFAFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 578,
                child: Container(
                  width: 396,
                  height: 67,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFFAFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 663,
                child: Container(
                  width: 396,
                  height: 67,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFFAFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 60,
                top: 345,
                child: SizedBox(
                  width: 360,
                  child: Text(
                    'Meus Dados',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 60,
                top: 428,
                child: SizedBox(
                  width: 360,
                  child: Text(
                    'Financeiro',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 58,
                top: 510,
                child: SizedBox(
                  width: 360,
                  child: Text(
                    'Solicitações',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 61,
                top: 598,
                child: SizedBox(
                  width: 360,
                  child: Text(
                    'Configurações',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 61,
                top: 683,
                child: SizedBox(
                  width: 360,
                  child: Text(
                    'Sair do Portal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 423,
                child: Container(
                  width: 32,
                  height: 32,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: -405,
                top: 881,
                child: Container(
                  width: 36,
                  height: 36,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 8,
                top: 507,
                child: Container(width: 41, height: 41, child: Stack()),
              ),
              Positioned(
                left: 356.53,
                top: 378.05,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.58),
                  width: 42.52,
                  height: 42.52,
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 355.53,
                top: 463.05,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.58),
                  width: 42.52,
                  height: 42.52,
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 355.53,
                top: 548.05,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.58),
                  width: 42.52,
                  height: 42.52,
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 12,
                top: 677,
                child: Container(
                  width: 42,
                  height: 42,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 356.53,
                top: 633.05,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.58),
                  width: 42.52,
                  height: 42.52,
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 11,
                top: 593,
                child: Container(width: 42, height: 42, child: Stack()),
              ),
              Positioned(
                left: 356.53,
                top: 718.05,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.58),
                  width: 42.52,
                  height: 42.52,
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 19,
                top: 343,
                child: Container(width: 32, height: 32, child: Stack()),
              ),
              Positioned(
                left: 304,
                top: 874,
                child: Container(
                  width: 64,
                  height: 4,
                  decoration: BoxDecoration(color: const Color(0xFF3A3A3A)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}