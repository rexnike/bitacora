
import 'package:bitacora/models/task_model.dart';
import 'package:bitacora/services/my_services_firestore.dart';
import 'package:bitacora/ui/general/colors.dart';
import 'package:bitacora/ui/widgets/button_normal_widget.dart';
import 'package:bitacora/ui/widgets/general_widgets.dart';
import 'package:bitacora/ui/widgets/textfield_normal_widget.dart';
import 'package:flutter/material.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {

  final formkey = GlobalKey<FormState>();
  MyServicesFireStore taskService = MyServicesFireStore(collection: "tasks");
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String categorySelected = "Pecho";

  showSelectDate()async{
    DateTime? datetime = await showDatePicker(
      context: context, 
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030),
        cancelText: "Cancelar",
        confirmText: "Aceptar",
        helpText: "Seleccionar Fecha",
        builder: (BuildContext context, Widget? widget){
          return Theme(
            data: ThemeData.dark().copyWith(
              dialogBackgroundColor: Colors.white,
              dialogTheme: DialogTheme(
                elevation: 0,
                backgroundColor: kBrandSecundatyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              colorScheme: ColorScheme.light(
                primary: kBrandPrimaryColor,
              ),
            ), 
            child: widget!,
            );
          },
        );

        if(DateTime != null){
          _dateController.text = datetime.toString().substring(0, 10);
          setState(() {});
        }
  }

  registerTask(){
      if(formkey.currentState!.validate()){

        TaskModel taskModel = TaskModel(
          title: _titleController.text, 
          description: _descriptionController.text, 
          date: _dateController.text, 
          category: categorySelected, 
          status: true,
        );
        taskService.addTask(taskModel).then((value){
          if(value.isNotEmpty){

            Navigator.pop(context);
            showSnackBarSuccess(context, "la tarea fue resgistrada con exito.");
            
          }
        }).catchError((error){
            showSnackBarError(context, "Hubo un inconveniente, intentelo nuevamente.");
            Navigator.pop(context);
        });            
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(14.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
              ),
          ),

          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
              const Text("Agregar tarea",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
              
              divider6(),
              TextFieldNormalhWidget(
                hintText: "Titulo",
                icon: Icons.text_fields,
                controller: _titleController,
              ),
          
              divider10(),
              TextFieldNormalhWidget(
                hintText: "Descripcion",
                icon: Icons.description,
                controller: _descriptionController,
              ),
              
              divider10(),
              const Text("Categoria:"),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 10.0,
                children: [
              FilterChip(
                selected: categorySelected == "Pecho",
                selectedColor: categoryColor[categorySelected],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: categorySelected == "Pecho" ? Colors.white : kBrandPrimaryColor, 
                ),
                label: Text("Pecho"), 
                onSelected: (bool value){
                  categorySelected = "Pecho";
                  setState(() {});
                },
              ),
              FilterChip(
                selected: categorySelected == "Espalda",
                selectedColor: categoryColor[categorySelected],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: categorySelected == "Espalda" ? Colors.white : kBrandPrimaryColor,
                ),
                label: Text("Espalda"), 
                onSelected: (bool value){
                  categorySelected = "Espalda";
                  setState(() {});
                },
              ),
              FilterChip(
                selected: categorySelected == "Pierna",
                selectedColor: categoryColor[categorySelected],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: categorySelected == "Pierna" ? Colors.white : kBrandPrimaryColor,
                ),
                label: Text("Pierna"), 
                onSelected: (bool value){
                  categorySelected = "Pierna";
                  setState(() {});
                },
              ),
              FilterChip(
                selected: categorySelected == "Brazos",
                selectedColor: categoryColor[categorySelected],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: categorySelected == "Brazos" ? Colors.white : kBrandPrimaryColor,
                ),
                label: Text("Brazos"), 
                onSelected: (bool value){
                  categorySelected = "Brazos";
                  setState(() {});
                },
              ),
                ],
              ),
          
              divider10(),
              TextFieldNormalhWidget(
                hintText: "Fecha", 
                icon: Icons.date_range,
                onTap: (){
                  showSelectDate();
                  },
                  controller: _dateController,
                ),
              
              divider20(),
              ButtonNormalWidget(
                onPressed: (){
                  registerTask();
                },
              ),
          
              ],
            ),
          ),
         );
  }
}