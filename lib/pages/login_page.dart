
import 'package:bitacora/ui/general/colors.dart';
import 'package:bitacora/ui/widgets/button_normal_widget.dart';
import 'package:bitacora/ui/widgets/general_widgets.dart';
import 'package:bitacora/ui/widgets/textfield_normal_widget.dart';
import 'package:bitacora/ui/widgets/textfield_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [

              divider30(),
              SvgPicture.asset('assets/images/uno.svg',
              height: 180.0,
              ),

              divider10(),
              Text("Inciar Sesion",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: kBrandPrimaryColor,
                ),
              ),

              divider10(),
              TextFieldNormalhWidget(
                hintText: "Correo electronico", 
                icon: Icons.email, 
                controller: _emailController,
                ),

              divider10(),
              divider6(),
              TextFieldPasswordWidget(
                controller: _passwordController,),

              divider20(),
              ButtonNormalWidget(onPressed: (){},),
            ],
          ),
        ),
      ),
    );
  }
}