
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  CollectionReference taskReference = FirebaseFirestore.instance.collection("task");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bitacora Gym"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              taskReference.get().then((value){
                QuerySnapshot collection = value;
                collection.docs.forEach((QueryDocumentSnapshot element) {
                  Map<String, dynamic> MyApp = element.data() as Map<String, dynamic>;
                  print(MyApp["title"]);
                });
              });
            }, 
            child: Text(
              "Obtener la Data",
              ),
            ),
            ElevatedButton(onPressed: (){
                taskReference.add(
                  {
                    "title": "Ir de compras al super2",
                    "description": "Debemos comprar comida para todo el mes",
                  },
                  ).then((DocumentReference value){
                  print(value.id);
                }).catchError((error){
                  print("Ocurrio un error en la registro");
                }).whenComplete((){
                  print("El registro ha terminado");
                });
            }, 
            child: Text(
              "Agregar documento",
              ),
            ),
            ElevatedButton(onPressed: (){
              taskReference
              .doc("xyjFGskygECyUlxQoQtb")
              .update({
                "title": "Ir de paseo",
                "description": "Tenemos que salir muy temprano",
              },)
              .catchError((error){
                print(error);
                },
              ).whenComplete((){
                print("Actualizacion Terminada");
              });
            }, 
            child: Text(
              "Actualizar doocumento",
              ),
            ),
            ElevatedButton(onPressed: (){
              taskReference.doc("QndGei8JjuWf86NLBo2y")
              .delete()
              .catchError((error){
                print(error);
              }).whenComplete((){
                print("La eliminacion esta completada");
              });
            }, 
            child: Text(
              "Eliminar Documento",
              ),
            ),
            ElevatedButton(onPressed: (){
              taskReference.doc("A00001").set(
                {
                  "title": "ir al concierto",
                  "description": "Este fin de semana debemos de ir al concierto",
              }).catchError((error){
                print("Creacion completad");
              });
            }, 
            child: Text(
              "Agregar documento personalizado",
              ),
            ),
          ],
        ),
      ),
    );
  }
}