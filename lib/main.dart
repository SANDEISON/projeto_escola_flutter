import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmapp/screens/autenticator_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gmapp/screens/home_screen.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: RoterScreen(),
    );
  }
}

class RoterScreen extends StatelessWidget {
  const RoterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(stream: FirebaseAuth.instance.userChanges(), builder: (context, snapshot) {
      if (snapshot.hasData){
        return HomeScreen();

      }else{
        return AutenticatorScreen();

      }
    },);
  }
}