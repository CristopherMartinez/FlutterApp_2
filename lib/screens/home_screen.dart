import 'dart:ui_web';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp_login/DataCarrusel/dataCarrusel.dart';
import 'package:flutterapp_login/Models/GameModel.dart';
import 'package:flutterapp_login/main.dart';
//import 'package:flutterapp_login/reausable_widgets/reausable_widget.dart';
import 'package:flutterapp_login/screens/signin_screen.dart';
import 'package:flutterapp_login/utils/colors_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  //For passing parameters
  /* 
  final String name;
  final String lastname;*/
  //Constructor
  const HomeScreen({
    super.key,
    /*required this.name, required this.lastname*/
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = supabase.auth.currentUser;
  final String? profileId = supabase.auth.currentUser?.id;
  final instanceSupabase = Supabase.instance.client; //get the id of the user
  String nameUser = '';
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //This property is for delete the navigationbar
          automaticallyImplyLeading: false,
          //We can use actions for put the button in this case in the end
          actions: [
            IconButton(
                onPressed: () async {
                  await supabase.auth.signOut();
                  if (!context.mounted) return;
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
            'SupaAPP',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        //Body
        body: <Widget>[
          /// Home page
          Container(
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
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Column(
                children: <Widget>[
                  const Text(
                    //We can access to the name and lastname using widget
                    //${user?.email?.toUpperCase()} email
                    //${nameUser.toUpperCase()}
                    'BIENVENID(A)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                    textAlign: TextAlign.center, //center the text
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      CarouselSlider.builder(
                          itemCount: carruselGames.length,
                          itemBuilder: (context, index, realIndex) {
                            final carruselGame = carruselGames[index];
                            return CardImages(
                              carruselGames: carruselGames[index],
                            );
                          },
                          options: CarouselOptions(
                              height: 200.0,
                              autoPlay: true,
                              autoPlayCurve: Curves.easeInOut,
                              enlargeCenterPage: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              scrollDirection: Axis.horizontal))
                    ],
                  )
                ],
              ),
            )),
          ),

          //CRUD PAGE
          Scaffold(
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
              child: const SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      //We can access to the name and lastname using widget
                      //${user?.email?.toUpperCase()} email
                      //${nameUser.toUpperCase()}
                      'CRUD',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                      textAlign: TextAlign.center, //center the text
                    ),
                  ],
                ),
              )),
            ),
          ),

          //SeetingsPage
          Scaffold(
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
              child: const SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'SETTINGS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                      textAlign: TextAlign.center, //center the text
                    ),
                  ],
                ),
              )),
            ),
          ),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: hexStringToColor("5E61F4"),
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'Add',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_applications,
              ),
              label: 'Settings',
            ),
          ],
        ));
  }

  //test
  Future<void> getDataUser() async {
    var response =
        await instanceSupabase.from('profiles').select().eq('id', {profileId});
    response[0]['name'] = nameUser;
  }
}

//Images of the carrousel
class CardImages extends StatelessWidget {
  final GameModel carruselGames;
  const CardImages({super.key, required this.carruselGames});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
            onTap: () {},
            child: FadeInImage(
                placeholder: AssetImage("assets/loading1.gif"),
                image: AssetImage(carruselGames.image),
                fit: BoxFit.cover)),
      ),
    );
  }
}
