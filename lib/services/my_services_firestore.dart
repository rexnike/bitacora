
import 'package:bitacora/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyServicesFireStore{

  String collection;
  MyServicesFireStore({required this.collection});

  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);

  Future<String> addTask(TaskModel model)async{
   DocumentReference documentReference = await _collectionReference.add(model.toJson());
   String id = documentReference.id;
   return id;
  }

}
