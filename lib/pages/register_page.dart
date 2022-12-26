
import 'package:bitacora/ui/general/colors.dart';
import 'package:bitacora/ui/widgets/button_custom_widget.dart';
import 'package:bitacora/ui/widgets/general_widgets.dart';
import 'package:bitacora/ui/widgets/textfield_normal_widget.dart';
import 'package:bitacora/ui/widgets/textfield_password_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  _registerUser()async{
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "naranja@gmail.com", 
      password: "123456789",
      );
      print(userCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              divider30(),
              SvgPicture.asset('assets/images/register.svg',
              height: 180.0,
              ),

              divider10(),
              Text("Registrate",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: kBrandPrimaryColor,
                ),
              ),

              divider20(),
              TextFieldNormalhWidget(
                hintText: "Nombre Completo", 
                icon: Icons.email, 
                controller: _fullNameController,
              ),

              divider10(),
              divider6(),
              TextFieldNormalhWidget(
                hintText: "Correo electronico", 
                icon: Icons.email, 
                controller: _emailController,
              ),

              divider10(),
              divider6(),
              TextFieldPasswordWidget(
                controller: _passwordController,
              ),

              divider20(),
              ButtomCustomWidget(
                text: "Registrate",
                icon: "check",
                color: kBrandPrimaryColor,
                onPressed: (){
                  _registerUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}