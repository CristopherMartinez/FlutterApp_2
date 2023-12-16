import 'package:flutter/material.dart';
//import 'package:flutterapp_login/reausable_widgets/reausable_widget.dart';
import 'package:flutterapp_login/screens/signin_screen.dart';
import 'package:flutterapp_login/utils/colors_utils.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String lastname;
  //Constructor
  const HomeScreen({super.key, required this.name, required this.lastname});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //This property is for delete the navigationbar
        automaticallyImplyLeading: false,
        //We can use actions for put the button in this case in the end
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))
        ],
        backgroundColor: hexStringToColor("CB2B93"),
        //the leading we can use for a icon before the title
        /*
        leading: IconButton(
          icon: logoWidgetLogOut("assets/images/logo1.png"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (  context) => const SignInScreen()));
          },
        ),*/
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      //Body
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
              Text(
                //We can access to the name and lastname using widget
                'BIENVENID(A) ${widget.name.toUpperCase()} ${widget.lastname.toUpperCase()}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              )
            ],
          ),
        )),
      ),
    );
  }
}
