
import 'package:bitacora/ui/general/colors.dart';
import 'package:flutter/material.dart';


Widget divider3() => const SizedBox(height: 3);
Widget divider6() => const SizedBox(height: 6);
Widget divider10() => const SizedBox(height: 10);
Widget divider20() => const SizedBox(height: 20);
Widget divider30() => const SizedBox(height: 30);
Widget divider40() => const SizedBox(height: 40);

Widget divider3Width() => const SizedBox(width: 3);
Widget divider6width() => const SizedBox(width: 6);
Widget divider10width() => const SizedBox(width: 10);
Widget divider20width() => const SizedBox(width: 20);
Widget divider30width() => const SizedBox(width: 30);
Widget divider40Width() => const SizedBox(width: 40);

Widget loadingWidget() => Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: kBrandPrimaryColor,
                    strokeWidth: 2.2,
                  ),
                ),
              );

showSnackBarSuccess(BuildContext context, String text){
ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                backgroundColor: const Color(0xff17c3b2),
                content: Row(
                  children: [
                    const Icon(Icons.check, color: Colors.white),
                    divider10width(),
                    Text(text),
                  ],
                ),
                ),
              );
            }

showSnackBarError(BuildContext context, String text){
ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                backgroundColor: Colors.redAccent,
                content: Row(
                  children: [
                    const Icon(Icons.warning_amber, color: Colors.white,),
                    divider10width(),
                    Text(text),
                  ],
                ),
                ),
              );
            }