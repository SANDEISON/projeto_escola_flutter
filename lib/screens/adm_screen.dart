import 'package:flutter/material.dart';
import 'package:flutter_gmapp/_common/my_colors.dart';
import 'package:flutter_gmapp/models/models_exerci.dart';
import 'package:flutter_gmapp/models/sentimento_model.dart';


class AdmScreen extends StatelessWidget {
   AdmScreen({super.key});

  final ExercicioModel exerciciomodel = ExercicioModel(id: "EX0001", name: "Remada baixa pronada", treino: "Treino B", comoFazer: "segura a barra firme");

  final List<SentimentoModel> listaSentimentos = [
    SentimentoModel(id: "SE001", sentindo: "Aluno - João Afredo Neves", data: " Inscrição: 2025-05-20"),
    SentimentoModel(id: "SE001", sentindo: "Aluno - Marcos Aurelion Machado", data: "Inscrição: 2025-03-10"),
    SentimentoModel(id: "SE001", sentindo: "Aluno - Kleber Texeira Lima", data: "Inscrição: 2025-09-08"),
    SentimentoModel(id: "SE001", sentindo: "Aluno - Pedro Alfredo da Silva", data: "Inscrição: 2025-11-31"),
    SentimentoModel(id: "SE001", sentindo: "Treinador - Mauricio de Valensa", data: "Inscrição: 2025-01-06"),
    SentimentoModel(id: "SE001", sentindo: "Treinador - Paulo da Fonte", data: "Inscrição: 2025-01-02"),
    SentimentoModel(id: "SE001", sentindo: "Nutricionista - José das flores", data: "Inscrição: 2025-02-14"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
      appBar: AppBar(title: Column(children: [
        Text("Administrador", style: TextStyle(color: Colors.white),),
        

      ],
      ),
      centerTitle: true,
      backgroundColor: MyColors.darkBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
          
            List.generate(listaSentimentos.length, (index){
              SentimentoModel sentimentoAgora = listaSentimentos[index];
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                title: Text(sentimentoAgora.sentindo, style: TextStyle(color: Colors.white, fontSize: 18),),
                subtitle: Text(sentimentoAgora.data, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                trailing: IconButton(onPressed: () {
                  print("DELETAR ${sentimentoAgora.sentindo}");
                }, icon: Icon(Icons.delete, color: Colors.red,)),
               
              );
            }),
      ),

    );
  }
}