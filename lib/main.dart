import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecask/Screens%20/welcome_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Authentication /presentation/signinPage.dart';
import 'Collection/application /bottle_bloc.dart';
import 'Collection/application /bottle_event.dart';
import 'Collection/presentation/myCollectionPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'EB Garamond',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontFamily: 'EB Garamond', fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'EB Garamond', fontSize: 16),
          bodyMedium: TextStyle(fontFamily: 'EB Garamond', fontSize: 16),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => BottleBloc()..add(FetchBottlesEvent()),
        child: SplashScreen(),  // Show SplashScreen initially
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSignInStatus();
  }

  void _checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSignedIn = prefs.getBool('isSignedIn') ?? false;

    Future.delayed(Duration(seconds: 3), () {
      if (isSignedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyCollectionScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wave.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
