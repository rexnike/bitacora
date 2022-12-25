
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
  }

  @override
  Widget build(BuildContext context) {
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
            Text("Categoria:"),
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
            TextFieldNormalhWidget(
              hintText: "Fecha", 
              icon: Icons.date_range,
              onTap: (){
                showSelectDate();
                },
              ),
            
            divider20(),
            ButtonNormalWidget(),

            ],
          ),
         );
  }
}