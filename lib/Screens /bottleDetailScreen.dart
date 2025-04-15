import 'package:flutter/material.dart';


class BottleDetailScreen extends StatefulWidget {
  @override
  _BottleDetailScreenState createState() => _BottleDetailScreenState();
}

class _BottleDetailScreenState extends State<BottleDetailScreen> {
  // Track selected tab (Details, Tasting notes, History)
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black54,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Genesis Collection',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 25),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
      // Fixed background image in the stack
      Positioned.fill(
      child: Image.asset(
        'assets/images/wave.png',
        fit: BoxFit.cover,
      ),
    ),

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0B1519),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/genuineIcon.png',
                            height: 30,
                            width: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Genuine Bottle (Unopened)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.amber,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottle Image
                Center(
                  child: Image.asset(
                    'assets/images/bottle.png',
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),

                // Bottle Information
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff122329),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 5),
                          Text(
                            'Bottle 135/184',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Talisker 18 Year Old #2504',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          // Tab buttons: Details, Tasting notes, History
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: _buildTabButton('Details', 0)),

                                Expanded(child: _buildTabButton('Tasting notes', 1)),

                                Expanded(child: _buildTabButton('History', 2)),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Display the selected tab's content
                          _selectedTabIndex == 0
                              ? _buildDetailsSection()
                              : _selectedTabIndex == 1
                              ? _buildTastingNotesSection()
                              : _buildHistorySection(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Center(
                    child: Container(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Add to my collection',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ]
      )
    );
  }

  // Method to build the tab buttons
  Widget _buildTabButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: _selectedTabIndex == index
              ? Colors.amber
              : Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: _selectedTabIndex == index
                  ? Colors.black
                  : Colors.white.withOpacity(0.7),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // Method to display the details section
  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Distillery', 'Talisker'),
        _buildDetailRow('Region', 'Isle of Skye'),
        _buildDetailRow('Country', 'Scotland'),
        _buildDetailRow('Type', 'Single Malt'),
        _buildDetailRow('Age Statement', '18 Years'),
        _buildDetailRow('Filled', '2020'),
        _buildDetailRow('Bottled', '2022'),
        _buildDetailRow('Cask Number', '2504'),
        _buildDetailRow('ABV', '45%'),
        _buildDetailRow('Size', '700ml'),
        _buildDetailRow('Finish', 'Long and Spicy'),
      ],
    );
  }

  // Method to display a row of details
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
  // Method to display the Tasting Notes Section
  Widget _buildTastingNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tasting notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'by Charles MacLean MBE',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color:Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),

            child:Center(
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: () {
                  // Play video logic here
                },
              ),
            ),
          ),
        ),
        _buildTastingDescription('Nose'),
        _buildTastingDescription('Palate'),
        _buildTastingDescription('Finish'),
        SizedBox(height: 20),
        // Your Notes Section
        Text(
          'Your Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        _buildTastingDescription('Nose'),
        _buildTastingDescription('Palate'),
        _buildTastingDescription('Finish'),
        SizedBox(height: 20),
        // Play Button for Video
      ],
    );
  }
  // Placeholder for Tasting Notes Section
  Widget _buildTastingDescription(String section) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff1E2A2E),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Description',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
            Text(
              'Description',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
            Text(
              'Description',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // History Section
  Widget _buildHistorySection() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1E2A2E),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Vertical line with circle indicators for history items
          _buildHistoryItem(),
          _buildHistoryItem(),
        ],
      ),
    );
  }

  // Method to build individual history item with continuous line
  Widget _buildHistoryItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          // Vertical line and circle indicator
          Column(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white, // Circle color
              ),
              Container(
                width: 1,
                height: 30, // Ensure the line extends as needed
                color: Colors.amber, // Line color
              ),
              CircleAvatar(
                radius: 4,
                backgroundColor: Colors.amber, // Circle color
              ),

              Container(
                width: 1,
                height: 10, // Ensure the line extends as needed
                color: Colors.amber, // Line color
              ),
              dimondShapeContainer(),
              Container(
                width: 1,
                height: 10, // Ensure the line extends as needed
                color: Colors.amber, // Line color
              ),
              CircleAvatar(
                radius: 4,
                backgroundColor: Colors.amber, // Circle color
              ),
              Container(
                width: 1,
                height: 140, // Ensure the line extends as needed
                color: Colors.amber, // Line color
              ),
            ],
          ),
          SizedBox(width: 15), // Space between line and content
          // Content (Title, Description, Attachments)
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1E2A2E),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label (Title)
                  Text(
                    'Label',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Title
                  Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  // Description
                  SizedBox(height: 5),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Attachments Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildAttachmentBox(),
                      SizedBox(width: 10),
                      _buildAttachmentBox(),
                      SizedBox(width: 10),
                      _buildAttachmentBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build attachment box
  Widget _buildAttachmentBox() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey, // Placeholder color for attachments
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget dimondShapeContainer(){
    return Transform.rotate(
      angle: 45 * 3.14159 / 180, // Rotate 45 degrees in radians
      child: Container(
        width: 10,  // Width of the square
        height: 10, // Height of the square
        decoration: BoxDecoration(
          color: Colors.amber,  // Color of the diamond
        ),
      ),
    );
  }

}
