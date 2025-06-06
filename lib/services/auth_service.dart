import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String?> cadUser({
    required String nome,
    required String senha,
    required String confirmsenha,
    required String email,
  }) async {
    try {
  UserCredential userCredential =
  await _firebaseAuth.createUserWithEmailAndPassword(
  email: email,
  password: senha);
  await userCredential.user!.updateDisplayName(nome);
  return null;
} on FirebaseAuthException catch(e) {
  if(e.code == "email-already-in-use") {
    return "O usuário já existe.";
  }
  return "Um erro desconhecido aconteceu.";
}
  }

  Future<String?> loginUser({required String email, required String senha}) async{
    try {
  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
  return null;
} on FirebaseAuthException catch (e) {
  return e.message;
}
  }
  Future<void> logoutUser() async{
    return _firebaseAuth.signOut();
  }
}