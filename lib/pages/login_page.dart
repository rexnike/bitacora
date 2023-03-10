
import 'package:bitacora/pages/register_page.dart';
import 'package:bitacora/services/my_services_firestore.dart';
import 'package:bitacora/ui/general/colors.dart';
import 'package:bitacora/ui/widgets/button_custom_widget.dart';
import 'package:bitacora/ui/widgets/general_widgets.dart';
import 'package:bitacora/ui/widgets/textfield_normal_widget.dart';
import 'package:bitacora/ui/widgets/textfield_password_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  MyServicesFireStore userService = MyServicesFireStore(collection: "users");

  _login()async{
    try{

      if(formkey.currentState!.validate()){
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text, 
      password: _passwordController.text,
        );

      if(userCredential.user != null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
        }
      }
      
    }on FirebaseAuthException catch(error){
      if(error.code == "invalid-email"){
        showSnackBarError(context, "El correo electronic es invalido");
      }else if(error.code == "user-noot-found"){
        showSnackBarError(context, "El usuario no esta registrado");
      }else if(error.code == "worong-password"){
        showSnackBarError(context, "La contraseña es incorrecta");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/fondo2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
          
                  divider150(),
                  /*
                  SvgPicture.asset('assets/images/uno.svg',
                  height: 180.0,
                  ),*/
          
                  divider10(),
                  Text("Inciar Sesion",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandSecundatyColor,
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
                  ButtomCustomWidget(
                    text: "Iniciar Sesion",
                    icon: "check2",
                    color: kBrandPrimaryColor,
                    onPressed: (){
                      _login();
                    },
                  ),
                  
                  divider20(),
                  Text("O ingrese con su correo",
                  style: TextStyle(
                          
                          color: kBrandSecundatyColor,
                    ),
                  ),
          
                  
                  divider20(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Aun no estas registrado?",
                        style: TextStyle(
                          
                          color: kBrandSecundatyColor
                        ),
                        ),
          
                  divider10width(),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage(),),);
                      },
                        child: Text("Registrate",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: kBrandSecundatyColor,
                        ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}