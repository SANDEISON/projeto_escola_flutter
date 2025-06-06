import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmapp/_common/my_colors.dart';
import 'package:flutter_gmapp/screens/adm_screen.dart';
import 'package:flutter_gmapp/screens/screen_exerci.dart';
import 'package:flutter_gmapp/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 150, 243, 1),
      appBar: AppBar(title: Row(
        children: [
          Text("Inicio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: const Color.fromARGB(255, 255, 255, 255)),),
          SizedBox(width: 40,),
          Text("Treinos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: const Color.fromARGB(255, 255, 255, 255)),),
          SizedBox(width: 40,),
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: 'Adm',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: const Color.fromARGB(255, 255, 255, 255)),
                recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdmScreen()));

                }
              ),
            ]
          ))
           
        ],
      ), centerTitle: true,
        backgroundColor: Color(0xFF0A6D92),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25)
          )
        ),
      ),
      drawer:  Drawer(
        child: ListView(children: [
          ListTile(leading: Icon(Icons.logout), title: Text("Deslogar"), onTap:() {
            AuthService().logoutUser();
          },)
        ],),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [
              MyColors.bluegradicolor,
              const Color.fromARGB(255, 10, 101, 172),
            ])),
          ),
          Column(
            children: [
              SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: MyColors.darkBlue, borderRadius: BorderRadius.circular(32)),
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                           const Text("Treino: 1",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              )
                              ,),
                              ElevatedButton(onPressed: () {
                                Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => ScreenEX()));
                              }, child: Text("Ir para o Exercício"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: MyColors.darkBlue, borderRadius: BorderRadius.circular(32)),
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                           const Text("Treino: 2",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              )
                              ,),
                              ElevatedButton(onPressed: () {}, child: Text("Ir para o Exercício"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: MyColors.darkBlue, borderRadius: BorderRadius.circular(32)),
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                           const Text("Treino: 3",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              )
                              ,),
                              ElevatedButton(onPressed: () {}, child: Text("Ir para o Exercício"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: MyColors.darkBlue, borderRadius: BorderRadius.circular(32)),
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                           const Text("Treino: 4",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              )
                              ,),
                              ElevatedButton(onPressed: () {}, child: Text("Ir para o Exercício"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: MyColors.darkBlue, borderRadius: BorderRadius.circular(32)),
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                           const Text("Treino: 5",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              )
                              ,),
                              ElevatedButton(onPressed: () {}, child: Text("Ir para o Exercício"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
            
          ),
        ],
      ),
    );
  }
}