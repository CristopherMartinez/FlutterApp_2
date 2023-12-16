import 'package:flutter/material.dart';
import 'package:flutterapp_login/reausable_widgets/reausable_widget.dart';
import 'package:flutterapp_login/screens/home_screen.dart';
import 'package:flutterapp_login/screens/signup_screen.dart';
import 'package:flutterapp_login/utils/colors_utils.dart';
import 'package:flutterapp_login/utils/reausable_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  //Define the _formKey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final supabase = Supabase.instance.client;

  bool visibilityPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/logo1.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  //Use the function that returns depending of the parameters
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
                    ), //The color of the error
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: passwordTextController,
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
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  signInSignUpButton(context, true, () async {
                    //if (!context.mounted) return;
                    //Go to Page Home
                    //Navigator.push(context,
                    //    MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  signUpOption()
                ],
              ),
            )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No tienes una cuenta?',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(' Registrate',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  void changeVisibilityPassword() {
    //Set the stage and change to false
    setState(() {
      visibilityPassword = !visibilityPassword;
    });
  }
}
