import 'package:flutter/material.dart';

import 'Screens /welcome_Screen.dart';

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
          displayLarge: TextStyle(fontFamily: 'EB Garamond',
              fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'EB Garamond',fontSize: 16),
          bodyMedium: TextStyle(fontFamily: 'EB Garamond',fontSize: 16),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
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
    _navigateToWelcomeScreen();
  }

  // Function to navigate to the Welcome Screen after a delay
  void _navigateToWelcomeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
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


