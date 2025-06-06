import 'package:flutter/material.dart';
import 'package:flutter_gmapp/_common/my_colors.dart';
import 'package:flutter_gmapp/_common/mysnackbar.dart';
import 'package:flutter_gmapp/components/decoration_autentication.dart';
import 'package:flutter_gmapp/screens/home_screen.dart';
import 'package:flutter_gmapp/services/auth_service.dart';


class AutenticatorScreen extends StatefulWidget {
  const AutenticatorScreen({super.key});

  @override
  State<AutenticatorScreen> createState() => _AutenticatorScreenState();
}

class _AutenticatorScreenState extends State<AutenticatorScreen> {
  bool enter = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _confirmsenhaController = TextEditingController();

  final AuthService _autenService = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              MyColors.bluegradicolor,
              MyColors.bluelowgradicolor
            ])),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("GymApp", textAlign: TextAlign.center, style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 126, 16, 16),),),
                      Image.asset("assets/Muscle.png"),
                              
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (value) {
                          if (value == null){
                            return "O e-mail precisa ser preenchido.";
                          }
                          if (value.length < 4){
                            return "E-mail inválido";
                          }
                          if (!value.contains("@")){
                            return "E-mail inválido";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                      controller: _senhaController,
                      decoration: getAuthenticationInputDecoration("Senha"),
                      validator: (value) {
                          if (value == null){
                            return "A senha precisa ser preenchida.";
                          }
                          if (value.length < 8){
                            return "A senha deve ter no mínimo 8 letras ou números.";
                          }
                          return null;
                        },
                        obscureText: true,),
                        SizedBox(height: 5,),
                        Visibility(visible: !enter , child: Column(
                          children: [
                            TextFormField(
                            controller: _confirmsenhaController,
                            decoration: getAuthenticationInputDecoration("Confirme a senha"),
                            validator: (value) {
                          if (value == null){
                            return "A confirmação de senha precisa ser preenchida.";
                          }
                          if (value != _senhaController.text){
                            return "As senhas estão diferentes";
                          }
                          return null;
                        },
                            obscureText: true,),
                            SizedBox(height: 5,),
                            TextFormField(
                            controller: _nomeController,
                            decoration: getAuthenticationInputDecoration("Nome"),
                            validator: (value) {
                          if (value == null || value.trim().isEmpty){
                            return "O nome precisa ser preenchido.";
                          }
                          if (value.length > 20){
                            return "Nome muito longo.";
                          }
                          return null;
                          
                        },
                            ),
                          ],
                        )
                  
                        ,),
                        SizedBox(height: 16,),
                        ElevatedButton(onPressed: () {
                          mainButtonClicked();
                        }, child: Text((enter)? "Entrar" : "Cadastrar")),
                        Divider(color: Color.fromARGB(134, 34, 38, 39),),
                        TextButton(onPressed: () {
                          setState(() {
                            enter = !enter;
                          });
                        }, child: Text((enter)?"Criar conta" : "Já tem uma conta? faça Login.")),
                        ElevatedButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                        }, child: Text("Ir para outra página WIP")),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  mainButtonClicked() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;
    String confirmsenha = _confirmsenhaController.text;
    if (_formKey.currentState!.validate()){
      if (enter){
        print("Entrada valida");
        _autenService.loginUser(email: email, senha: senha).then((String? erro) {
          if (erro !=null){
            showwSnackBar(context: context, texto: erro);
          }
        });
      }
      else{
        print("cadastro valido");
        print("${_emailController.text}, ${_senhaController.text}, ${_nomeController.text}, ${_confirmsenhaController.text}");
        _autenService.cadUser(nome: nome, senha: senha, confirmsenha: confirmsenha, email: email)
        .then((String? erro) {
          if (erro != null){
            //erros fodas
            showwSnackBar(context: context, texto: erro);
          } 
        },);
      }
    } else {
      print("invalido form");
    }
  }
}