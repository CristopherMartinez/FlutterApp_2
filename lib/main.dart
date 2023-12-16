import 'package:flutter/material.dart';
import 'package:flutterapp_login/screens/signin_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; //import the package of supabase

//This app is a LoginPage and SingUpPage with Supabase

//In the documentation of Supabase they say that we need to defined to const and then pass to the Initialize
const supabaseUrl = 'https://jhdebqgdocvhrsuvbonp.supabase.co';
const supabaseKey = String.fromEnvironment(
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpoZGVicWdkb2N2aHJzdXZib25wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI1MTUxMDksImV4cCI6MjAxODA5MTEwOX0.83EBSkc3bf749btXsHtnSglxNru6KbgBrPC-PzXwNg8');
//But for me it didn´t work, I needed to put directly

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Here I put the url and anoKey directly and it works, the other way failed
  await Supabase.initialize(
      url: 'https://jhdebqgdocvhrsuvbonp.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpoZGVicWdkb2N2aHJzdXZib25wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI1MTUxMDksImV4cCI6MjAxODA5MTEwOX0.83EBSkc3bf749btXsHtnSglxNru6KbgBrPC-PzXwNg8',
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce, // set to pkce by default
      )); //Initializing supabase
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}
