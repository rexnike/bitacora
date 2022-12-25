
import 'package:bitacora/ui/general/colors.dart';
import 'package:flutter/material.dart';

class TextFieldNormalhWidget extends StatelessWidget {
  
  String hintText;
  IconData icon;
  Function? onTap;

  TextFieldNormalhWidget({
    required this.hintText, 
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
                    onTap: onTap != null ? (){onTap!();} : null,
                    readOnly: onTap != null ? true : false,
                    decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                      prefixIcon: Icon(
                        icon, 
                        size: 20.0, 
                        color: kBrandPrimaryColor.withOpacity(0.6),
                        ),
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: kBrandPrimaryColor.withOpacity(0.6),
                      ),
                      filled: true,
                      fillColor: kBrandSecundatyColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  );
  }
}