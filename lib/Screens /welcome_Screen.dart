import 'package:flutter/material.dart';

import '../Authentication /presentation/signinPage.dart';

class WelcomeScreen extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  color: Color(0xff122329),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Text text text', // Placeholder text
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),

                    SizedBox(height: 40),
                    // Scan bottle button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add scan bottle logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber, // Button color
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Scan bottle',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account?',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignInScreen()),
                            );
                          },
                          child: Text(
                            'Sign in first',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ]
                ),
                ),

              SizedBox(height: 30),
              // Sign-in link

            ],
          ),
        ),
      ),
    );
  }
}
