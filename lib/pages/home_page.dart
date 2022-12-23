
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
          ],
        ),
      ),
    );
  }
}