import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Screens /bottleDetailScreen.dart';

class MyCollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0E1C21),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Color(0xff0E1C21),
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
              Icons.notifications,
              color: Colors.red,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.6,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return CollectionItem();
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
            ),            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/settings.svg',
              height: 40,
              width: 40,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class CollectionItem extends StatelessWidget {
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
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Springbank 1992 #1234',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                '(112/128)',
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
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottleDetailScreen()),
        );
      },
    );
  }
}
