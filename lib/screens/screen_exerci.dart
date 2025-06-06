import 'package:flutter/material.dart';
import 'package:flutter_gmapp/_common/my_colors.dart';
import 'package:flutter_gmapp/models/models_exerci.dart';
import 'package:flutter_gmapp/models/sentimento_model.dart';

class ScreenEX extends StatelessWidget {
   ScreenEX({super.key});

  final ExercicioModel exerciciomodel = ExercicioModel(id: "EX0001", name: "Remada baixa pronada", treino: "Treino B", comoFazer: "segura a barra firme");

  final List<SentimentoModel> listaSentimentos = [
    SentimentoModel(id: "SE001", sentindo: "Estou com os braços doloridos", data: "2025-05-27"),
    SentimentoModel(id: "SE001", sentindo: "Me sinto mais ativo", data: "2025-06-13"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
      appBar: AppBar(title: Text( "${exerciciomodel.name} - ${exerciciomodel.treino}", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
      centerTitle: true,
      backgroundColor:  MyColors.darkBlue,
      elevation: 0,
      toolbarHeight: 72,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("Foi clicado");
      }, child: const Icon(Icons.add),),
      body: Container(
        margin:  const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: [
          SizedBox(
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Enviar foto")),
                ElevatedButton(onPressed: () {}, child: const Text("Tirar foto"))
              ],
            )),
            const SizedBox(height: 8,),
          const Text("Como fazer?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          const SizedBox(height: 8,),
          Text(exerciciomodel.comoFazer),
           const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(color: Colors.black,),
          ),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text("Voltar WIP")),
          const Text("Como estou me sentindo?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          const SizedBox(height: 8,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(listaSentimentos.length, (index){
              SentimentoModel sentimentoAgora = listaSentimentos[index];
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                title: Text(sentimentoAgora.sentindo),
                subtitle: Text(sentimentoAgora.data),
                leading: const Icon(Icons.double_arrow_rounded),
                trailing: IconButton(onPressed: () {
                  print("DELETAR ${sentimentoAgora.sentindo}");
                }, icon: Icon(Icons.delete, color: Colors.red,)),
               
              );
            }),
           )
        ],),
      )
    );
  }
}

