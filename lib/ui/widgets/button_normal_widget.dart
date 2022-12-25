
import 'package:bitacora/ui/general/colors.dart';
import 'package:flutter/material.dart';

class ButtonNormalWidget extends StatelessWidget {
  const ButtonNormalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 52.0,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: kBrandPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  )
                ), 
                icon: Icon(Icons.search), 
                label: Text("Guardar",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            );
  }
}