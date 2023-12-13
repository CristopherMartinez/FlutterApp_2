import 'package:flutter/material.dart';
import 'package:flutterapp_login/reausable_widgets/reausable_widget.dart';
import 'package:flutterapp_login/screens/home_screen.dart';
import 'package:flutterapp_login/utils/colors_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Registro',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:
                //The List of the colors
                [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: <Widget>[
              reusableTextfield("Escribe tu usuario", Icons.person_outline,
                  false, userNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextfield("Escribe tu correo", Icons.email_outlined,
                  false, emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextfield("Password", Icons.password_outlined, true,
                  passwordController),
              signInSignUpButton(context, false, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              })
            ],
          ),
        )),
      ),
    );
  }
}
