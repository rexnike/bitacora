
import 'package:bitacora/pages/register_page.dart';
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

  _loginWithGoogle()async{
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if(googleSignInAccount == null){
      return;
    }
  
    GoogleSignInAuthentication _googleSingInAuth = await googleSignInAccount.authentication;

    OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: _googleSingInAuth.idToken,
      accessToken: _googleSingInAuth.accessToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
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
                ButtomCustomWidget(
                  text: "Iniciar Sesion",
                  icon: "check2",
                  color: kBrandPrimaryColor,
                  onPressed: (){
                    _login();
                  },
                ),
                
                divider20(),
                Text("O ingrese con su correo"),
          
                divider20(),
                ButtomCustomWidget(
                  text: "Iniciar Sesion con Google",
                  icon: "google",
                  color: Color(0xfff84b2a),
                  onPressed: (){
                    _loginWithGoogle();
                  },
                ),

                divider20(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿Aun no estas registrado?"
                      ),
          
                    divider10width(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage(),),);
                      },
                      child: Text("Registrate",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kBrandPrimaryColor,
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
    );
  }
}