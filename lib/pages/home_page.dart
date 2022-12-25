
import 'package:bitacora/models/task_model.dart';
import 'package:bitacora/ui/general/colors.dart';
import 'package:bitacora/ui/widgets/button_normal_widget.dart';
import 'package:bitacora/ui/widgets/general_widgets.dart';
import 'package:bitacora/ui/widgets/item_task_widget.dart';
import 'package:bitacora/ui/widgets/textfield_normal_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  CollectionReference taskReference = 
    FirebaseFirestore.instance.collection("tasks");

  ShowTaskForm(BuildContext context){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, 
      builder: (BuildContext context){
        return Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
              ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Agregar tarea",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),
            ),
            
            divider6(),
            TextFieldNormalhWidget(
              hintText: "Titulo",
              icon: Icons.text_fields,
            ),

            divider10(),
            TextFieldNormalhWidget(
              hintText: "Descripcion",
              icon: Icons.description,
            ),
            
            divider10(),
            Text("Categoria"),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 10.0,
              children: [
                FilterChip(
              selected: true,
              selectedColor: categoryColor["Pecho"],
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              label: Text("Pecho"), 
              onSelected: (bool value){},
            ),
            FilterChip(
              selected: true,
              selectedColor: categoryColor["Espalda"],
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              label: Text("Espalda"), 
              onSelected: (bool value){},
            ),
            FilterChip(
              selected: true,
              selectedColor: categoryColor["Pierna"],
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              label: Text("Pierna"), 
              onSelected: (bool value){},
            ),
            FilterChip(
              selected: true,
              selectedColor: categoryColor["Brazos"],
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              label: Text("Brazos"), 
              onSelected: (bool value){},
            ),
              ],
            ),

            divider10(),
            ButtonNormalWidget(),

            ],
          ),
         );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandtercerColor,
      floatingActionButton: InkWell(
        onTap: () {
          ShowTaskForm(context);
        },
        borderRadius: BorderRadius.circular(14.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0,),
          decoration: BoxDecoration(
            color: kBrandSecundatyColor,
            borderRadius: BorderRadius.circular(14.0),
          ),
      
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.add,
              color: Colors.black,
              ),
              
              Text("Nuevo Progreso",
              style: TextStyle(
                color: Colors.black,
              ),
              ),
            ],
          ),
        ),
      ),

     body: SingleChildScrollView(
      child:  Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0,),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 12,
                  offset: const Offset(4, 4),
                ),
              ],
            ),

            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Bienvenido a su Bitacora",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w500,
                    color: kBrandPrimaryColor,
                      ),
                    ),

                  Text("Mi Seguimiento",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandPrimaryColor,
                    ),
                  ),

                  divider10(),

                  TextFieldNormalhWidget(
                    icon: Icons.search,
                    hintText: "Buscar tarea...",
                  ),
                ],
              ),
            ),
          ),

         Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text("Tus Progresos",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: kBrandSecundatyColor.withOpacity(0.85),
          ),
          ),

          StreamBuilder(
            stream: taskReference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot snap){
              if(snap.hasData){
                List<TaskModel> tasks = [];
                QuerySnapshot collection = snap.data;
                
                tasks = collection.docs.map((e) => TaskModel.fromJson(e.data() as Map<String, dynamic>) ).toList();

                return ListView.builder(
                  itemCount: tasks.length,
                  shrinkWrap: true,
                  physics:const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return ItemTaskWidget(
                      taskModel: tasks[index],
                    );
                  },
                );
              }
              return loadingWidget();
            },
          ),
          
          
            ],
          ),
         ),

        ],
      ),
     ),
      );
    }
}