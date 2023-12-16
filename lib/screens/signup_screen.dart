import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp_login/Models/UserSupabase.dart';
import 'package:flutterapp_login/reausable_widgets/reausable_widget.dart';
import 'package:flutterapp_login/screens/home_screen.dart';
//import 'package:flutterapp_login/services/service_db.dart';
import 'package:flutterapp_login/utils/colors_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  //late Servicedb _servicedb;
  final instanceSupabase = Supabase.instance.client;

  //Define the _formKey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool visibilityPassword = true;

  @override
  void initState() {
    super.initState();
    //
    //_servicedb = Servicedb();
    //var users = _servicedb.getUsers();
    //fetchDataSupabase();
  }

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
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  //This is the other form, passing parameters to the reusableWidget
                  //reusableTextfield("Escribe tu nombre", Icons.person_outline,
                  //false, nameTextController),

                  //This is the textFormFiel for the name
                  TextFormField(
                    controller: nameTextController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline,
                            color: Colors.white70),
                        labelText: "Escribe tu nombre",
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.9)),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        errorStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          onPressed: () {
                            nameTextController.clear(); //Set the value to empty
                          },
                          icon: const Icon(Icons.clear),
                          color: Colors.white,
                        )),
                    keyboardType: TextInputType.name,
                    validator: (name) => name!.length < 4
                        ? 'El nombre debe tener al menos 4 letras'
                        : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Lastname
                  TextFormField(
                    controller: lastNameController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outlined,
                            color: Colors.white70),
                        labelText: "Apellido",
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.9)),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        errorStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          onPressed: () {
                            lastNameController.clear(); //Set the value to empty
                          },
                          icon: const Icon(Icons.clear),
                          color: Colors.white,
                        )), //The color of the error
                    keyboardType: TextInputType.name,
                    validator: (name) => name!.length < 3
                        ? 'El apellido debe tener al menos 3 letras'
                        : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //email
                  TextFormField(
                    controller: emailTextController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.white70),
                        labelText: "Email",
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.9)),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        errorStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          onPressed: () {
                            emailTextController
                                .clear(); //Set the value to empty
                          },
                          icon: const Icon(Icons.clear),
                          color: Colors.white,
                        )), //The color of the error
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password_outlined,
                            color: Colors.white70),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.9)),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        errorStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          onPressed: changeVisibilityPassword,
                          icon: Icon(
                            visibilityPassword
                                ? //if the visibility is true show the icon of the visibility off else show the eye
                                Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined, //
                            color: Colors.white,
                          ),
                        )), //The color of the error
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: visibilityPassword, //For password
                    validator: validatePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  signInSignUpButton(context, false, () async {
                    //Validate the form
                    if (_formKey.currentState!.validate()) {
                      UserSupabase user = UserSupabase(
                          nameTextController.text,
                          lastNameController.text,
                          emailTextController.text,
                          passwordController.text);

                      Map<String, dynamic> userJson = user.toJson();

                      //Insert the user in supabase
                      await instanceSupabase.from('user').insert(userJson);

                      if (!context.mounted) return;
                      //if all is good, go to the HomeScreen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                  name: nameTextController.text,
                                  lastname: lastNameController.text)));
                    }
                  })
                ],
              ),
            )),
      ),
    );
  }

  //Test
  Future<void> fetchDataSupabase() async {
    //final supabase = Supabase.instance.client;
    //var response = await supabase.from('user').select('*');
    //print(response);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Ingresa un email valido';
    }
    return null;
  }

  //ValidatePassword
  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Escribe un password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Debe contener al menos una letra Mayuscula\nDebe contener al menos una letra minúscula\nDebe contener al menos un número\nDebe contener al menos 1 caracter especial\nDebe tener al menos 8 caracteres\nEscribe un password valido';
      } else {
        return null;
      }
    }
  }

  void changeVisibilityPassword() {
    //Set the stage and change to false
    setState(() {
      visibilityPassword = !visibilityPassword;
    });
  }
}
