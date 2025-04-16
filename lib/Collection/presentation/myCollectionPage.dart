import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Authentication /presentation/signinPage.dart';
import '../../Screens /welcome_Screen.dart';
import '../application /bottle_bloc.dart';
import '../application /bottle_event.dart';
import '../application /bottle_state.dart';
import '../domain /bottle_model.dart';
import 'bottleDetailScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xff0E1C21),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff0E1C21),
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'My collection',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'EB Garamond',
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notification_add_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => BottleBloc()..add(FetchBottlesEvent()), // Initialize and trigger event
          child: BlocBuilder<BottleBloc, BottleState>(
            builder: (context, state) {
              if (state is BottleLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BottleLoaded) {
                return GridView.builder(
                  padding: EdgeInsets.all(16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.58,
                  ),
                  itemCount: state.bottles.length,
                  itemBuilder: (context, index) {
                    var bottle = state.bottles[index];
                    return CollectionItem(bottle: bottle);
                  },
                );
              } else if (state is BottleError) {
                return Center(child: Text('Failed to load bottles: ${state.error}'));
              }
              return Center(child: Text('No Bottles Available'));
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Color(0xff0B1519),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/scanImage.svg',
                height: 40,
                width: 40,
              ),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/collection.svg',
                height: 40,
                width: 40,
              ),
              label: 'Collection',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/shop.svg',
                height: 40,
                width: 40,
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout, size: 30),
              label: 'Sign out',
            ),
          ],
          onTap: (index) {
            if (index == 3) {
              _showSignOutDialog(context);
            }
          },
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out'),
          content: Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('isSignedIn', false);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      (route) => false,
                );
              },
              child: Text('Sign Out',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}

class CollectionItem extends StatelessWidget {
  CollectionItem({required this.bottle});
  final Bottle bottle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff1E2A2E),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/bottle.png',
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "EB Garamond",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "${bottle.name} ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "${bottle.age} Old",
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                bottle.quantity,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return BottleDetailScreen(bottle: bottle);
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // From right to left
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child); // You can change it to FadeTransition for fade
            },
          ),
        );
      },
    );
  }
}
